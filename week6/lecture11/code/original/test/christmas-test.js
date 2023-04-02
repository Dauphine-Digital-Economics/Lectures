const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Naughty List", function(){
	async function deployFixture(){
		// Contract Deployment
		const christmasByte = await ethers.getContractFactory("christmas");
		const ChristmasContract = await christmasByte.deploy();
		await ChristmasContract.deployed();

		return {ChristmasContract};
	}
	it("Add existing", async function(){

		const { ChristmasContract } = await loadFixture(deployFixture);

		ChristmasContract.increase_naughty_score("Annie");		
		var Annie_score = await ChristmasContract.get_score("Annie")

		expect(Annie_score).to.equal(10)

	});

	it("Add new", async function(){
		const { ChristmasContract } = await loadFixture(deployFixture);

		ChristmasContract.increase_naughty_score("Brad");
		var Brad_score = await ChristmasContract.get_score("Brad")

		expect(Brad_score).to.equal(10)
	})
});
