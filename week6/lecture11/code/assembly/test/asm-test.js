const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Assembly Code", function(){
	async function deployFixture(){
		// Contract Deployment
		const asmByte = await ethers.getContractFactory("asm");
		const asmContract = await asmByte.deploy();
		await asmContract.deployed();

		return {asmContract}
	}

	it("Get element 3 from fixed array", async function(){
		const {asmContract} = await loadFixture(deployFixture);
		expect(await asmContract.get_fixed_element(2)).to.equal(3)
	});

	it("Get element 5 from dynamic array", async function(){
		const {asmContract} = await loadFixture(deployFixture);
		expect(await asmContract.get_dynamic_element(4)).to.equal(5)
	})
	
	it("Get element 1 from mapping", async function(){
		const {asmContract} = await loadFixture(deployFixture);
		expect(await asmContract.get_map_element(1)).to.equal(1)
	})
	it("Get element 4 from dynamic array", async function(){
		const {asmContract} = await loadFixture(deployFixture);
		expect(await asmContract.get_dynamic_element(3)).to.equal(4)
	})
});
