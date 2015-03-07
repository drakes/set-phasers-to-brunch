# Each app module should get its own test module
# someModuleToTest = require 'path/some-module-to-test'

describe 'someModuleToTest', ->
	beforeEach ->
		# set up tests
		# create instances, initialize, bind, etc.

	afterEach ->
		# tear down tests
		# clean up, unbind, etc.

	it 'does something', ->
		expect(on).not.to.equal off
