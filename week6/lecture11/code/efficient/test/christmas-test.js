const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Naughty List", function(){
	async function deployFixture(){
		//Get two addresses
		const [addr0, addr1] = await ethers.getSigners();

		// Contract Deployment
		const christmasByte = await ethers.getContractFactory("christmas");
		const ChristmasContract = await christmasByte.deploy();
		await ChristmasContract.deployed();

		// Set a naught score for addr0;
		ChristmasContract.increase_naughty_score(addr0.address);

		return {ChristmasContract, addr0, addr1};
	}

	it("Add existing", async function(){

		const { ChristmasContract, addr0, addr1 } = await loadFixture(deployFixture);

		ChristmasContract.increase_naughty_score(addr0.address);		
		var Addr0_score = await ChristmasContract.get_score(addr0.address);

		expect(Addr0_score).to.equal(20)

	});

	it("Add new", async function(){
		const { ChristmasContract, addr0, addr1 } = await loadFixture(deployFixture);

		ChristmasContract.increase_naughty_score(addr1.address);
		var Addr1_score = await ChristmasContract.get_score(addr1.address)

		expect(Addr1_score).to.equal(10)
	})
});
