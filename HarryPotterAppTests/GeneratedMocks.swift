// MARK: - Mocks generated from file: HarryPotterApp/Networking/HarryPotterApiClientInterface.swift at 2020-09-20 09:26:02 +0000

//
//  HarryPotterApiClientInterface.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//
import Cuckoo
@testable import HarryPotterApp

import PromiseKit


 class MockHarryPotterApiClientInterface: HarryPotterApiClientInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = HarryPotterApiClientInterface
    
     typealias Stubbing = __StubbingProxy_HarryPotterApiClientInterface
     typealias Verification = __VerificationProxy_HarryPotterApiClientInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HarryPotterApiClientInterface?

     func enableDefaultImplementation(_ stub: HarryPotterApiClientInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    
    
     required init(baseUrl: String, apiKey: String) {
        
    }
    

    
    
    
     func getCharacters() -> Promise<[Character]> {
        
    return cuckoo_manager.call("getCharacters() -> Promise<[Character]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCharacters())
        
    }
    

	 struct __StubbingProxy_HarryPotterApiClientInterface: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCharacters() -> Cuckoo.ProtocolStubFunction<(), Promise<[Character]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHarryPotterApiClientInterface.self, method: "getCharacters() -> Promise<[Character]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HarryPotterApiClientInterface: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCharacters() -> Cuckoo.__DoNotUse<(), Promise<[Character]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCharacters() -> Promise<[Character]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HarryPotterApiClientInterfaceStub: HarryPotterApiClientInterface {
    

    
     required init(baseUrl: String, apiKey: String) {
        
    }
    

    
     func getCharacters() -> Promise<[Character]>  {
        return DefaultValueRegistry.defaultValue(for: (Promise<[Character]>).self)
    }
    
}

