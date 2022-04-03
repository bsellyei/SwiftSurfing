// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
@testable import App


// MARK: - IConversationService

open class IConversationServiceMock: IConversationService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getConversations(user: User) throws -> [Conversation] {
        addInvocation(.m_getConversations__user_user(Parameter<User>.value(`user`)))
		let perform = methodPerformValue(.m_getConversations__user_user(Parameter<User>.value(`user`))) as? (User) -> Void
		perform?(`user`)
		var __value: [Conversation]
		do {
		    __value = try methodReturnValue(.m_getConversations__user_user(Parameter<User>.value(`user`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getConversations(user: User). Use given")
			Failure("Stub return value not specified for getConversations(user: User). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func createConversation(conversation: Conversation) throws -> Conversation {
        addInvocation(.m_createConversation__conversation_conversation(Parameter<Conversation>.value(`conversation`)))
		let perform = methodPerformValue(.m_createConversation__conversation_conversation(Parameter<Conversation>.value(`conversation`))) as? (Conversation) -> Void
		perform?(`conversation`)
		var __value: Conversation
		do {
		    __value = try methodReturnValue(.m_createConversation__conversation_conversation(Parameter<Conversation>.value(`conversation`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createConversation(conversation: Conversation). Use given")
			Failure("Stub return value not specified for createConversation(conversation: Conversation). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func deleteConversation(id: String?) throws -> Bool {
        addInvocation(.m_deleteConversation__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_deleteConversation__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteConversation__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for deleteConversation(id: String?). Use given")
			Failure("Stub return value not specified for deleteConversation(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func connectUsers(id: String?, users: [User]) throws -> Bool {
        addInvocation(.m_connectUsers__id_idusers_users(Parameter<String?>.value(`id`), Parameter<[User]>.value(`users`)))
		let perform = methodPerformValue(.m_connectUsers__id_idusers_users(Parameter<String?>.value(`id`), Parameter<[User]>.value(`users`))) as? (String?, [User]) -> Void
		perform?(`id`, `users`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_connectUsers__id_idusers_users(Parameter<String?>.value(`id`), Parameter<[User]>.value(`users`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for connectUsers(id: String?, users: [User]). Use given")
			Failure("Stub return value not specified for connectUsers(id: String?, users: [User]). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getConversations__user_user(Parameter<User>)
        case m_createConversation__conversation_conversation(Parameter<Conversation>)
        case m_deleteConversation__id_id(Parameter<String?>)
        case m_connectUsers__id_idusers_users(Parameter<String?>, Parameter<[User]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getConversations__user_user(let lhsUser), .m_getConversations__user_user(let rhsUser)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher), lhsUser, rhsUser, "user"))
				return Matcher.ComparisonResult(results)

            case (.m_createConversation__conversation_conversation(let lhsConversation), .m_createConversation__conversation_conversation(let rhsConversation)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConversation, rhs: rhsConversation, with: matcher), lhsConversation, rhsConversation, "conversation"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteConversation__id_id(let lhsId), .m_deleteConversation__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_connectUsers__id_idusers_users(let lhsId, let lhsUsers), .m_connectUsers__id_idusers_users(let rhsId, let rhsUsers)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUsers, rhs: rhsUsers, with: matcher), lhsUsers, rhsUsers, "users"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getConversations__user_user(p0): return p0.intValue
            case let .m_createConversation__conversation_conversation(p0): return p0.intValue
            case let .m_deleteConversation__id_id(p0): return p0.intValue
            case let .m_connectUsers__id_idusers_users(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getConversations__user_user: return ".getConversations(user:)"
            case .m_createConversation__conversation_conversation: return ".createConversation(conversation:)"
            case .m_deleteConversation__id_id: return ".deleteConversation(id:)"
            case .m_connectUsers__id_idusers_users: return ".connectUsers(id:users:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getConversations(user: Parameter<User>, willReturn: [Conversation]...) -> MethodStub {
            return Given(method: .m_getConversations__user_user(`user`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createConversation(conversation: Parameter<Conversation>, willReturn: Conversation...) -> MethodStub {
            return Given(method: .m_createConversation__conversation_conversation(`conversation`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteConversation(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteConversation__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func connectUsers(id: Parameter<String?>, users: Parameter<[User]>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_connectUsers__id_idusers_users(`id`, `users`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getConversations(user: Parameter<User>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getConversations__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getConversations(user: Parameter<User>, willProduce: (StubberThrows<[Conversation]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getConversations__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Conversation]).self)
			willProduce(stubber)
			return given
        }
        public static func createConversation(conversation: Parameter<Conversation>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createConversation__conversation_conversation(`conversation`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createConversation(conversation: Parameter<Conversation>, willProduce: (StubberThrows<Conversation>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createConversation__conversation_conversation(`conversation`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Conversation).self)
			willProduce(stubber)
			return given
        }
        public static func deleteConversation(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_deleteConversation__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func deleteConversation(id: Parameter<String?>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_deleteConversation__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func connectUsers(id: Parameter<String?>, users: Parameter<[User]>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_connectUsers__id_idusers_users(`id`, `users`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func connectUsers(id: Parameter<String?>, users: Parameter<[User]>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_connectUsers__id_idusers_users(`id`, `users`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getConversations(user: Parameter<User>) -> Verify { return Verify(method: .m_getConversations__user_user(`user`))}
        public static func createConversation(conversation: Parameter<Conversation>) -> Verify { return Verify(method: .m_createConversation__conversation_conversation(`conversation`))}
        public static func deleteConversation(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteConversation__id_id(`id`))}
        public static func connectUsers(id: Parameter<String?>, users: Parameter<[User]>) -> Verify { return Verify(method: .m_connectUsers__id_idusers_users(`id`, `users`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getConversations(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_getConversations__user_user(`user`), performs: perform)
        }
        public static func createConversation(conversation: Parameter<Conversation>, perform: @escaping (Conversation) -> Void) -> Perform {
            return Perform(method: .m_createConversation__conversation_conversation(`conversation`), performs: perform)
        }
        public static func deleteConversation(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteConversation__id_id(`id`), performs: perform)
        }
        public static func connectUsers(id: Parameter<String?>, users: Parameter<[User]>, perform: @escaping (String?, [User]) -> Void) -> Perform {
            return Perform(method: .m_connectUsers__id_idusers_users(`id`, `users`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ICouchService

open class ICouchServiceMock: ICouchService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getAllCouches() throws -> [Couch] {
        addInvocation(.m_getAllCouches)
		let perform = methodPerformValue(.m_getAllCouches) as? () -> Void
		perform?()
		var __value: [Couch]
		do {
		    __value = try methodReturnValue(.m_getAllCouches).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllCouches(). Use given")
			Failure("Stub return value not specified for getAllCouches(). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getCouch(id: String?) throws -> Couch? {
        addInvocation(.m_getCouch__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_getCouch__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Couch? = nil
		do {
		    __value = try methodReturnValue(.m_getCouch__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
		return __value
    }

    open func createCouch(couch: Couch) throws -> Couch {
        addInvocation(.m_createCouch__couch_couch(Parameter<Couch>.value(`couch`)))
		let perform = methodPerformValue(.m_createCouch__couch_couch(Parameter<Couch>.value(`couch`))) as? (Couch) -> Void
		perform?(`couch`)
		var __value: Couch
		do {
		    __value = try methodReturnValue(.m_createCouch__couch_couch(Parameter<Couch>.value(`couch`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createCouch(couch: Couch). Use given")
			Failure("Stub return value not specified for createCouch(couch: Couch). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func deleteCouch(id: String?) throws -> Bool {
        addInvocation(.m_deleteCouch__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_deleteCouch__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteCouch__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for deleteCouch(id: String?). Use given")
			Failure("Stub return value not specified for deleteCouch(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getAllCouches
        case m_getCouch__id_id(Parameter<String?>)
        case m_createCouch__couch_couch(Parameter<Couch>)
        case m_deleteCouch__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getAllCouches, .m_getAllCouches): return .match

            case (.m_getCouch__id_id(let lhsId), .m_getCouch__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_createCouch__couch_couch(let lhsCouch), .m_createCouch__couch_couch(let rhsCouch)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCouch, rhs: rhsCouch, with: matcher), lhsCouch, rhsCouch, "couch"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteCouch__id_id(let lhsId), .m_deleteCouch__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getAllCouches: return 0
            case let .m_getCouch__id_id(p0): return p0.intValue
            case let .m_createCouch__couch_couch(p0): return p0.intValue
            case let .m_deleteCouch__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getAllCouches: return ".getAllCouches()"
            case .m_getCouch__id_id: return ".getCouch(id:)"
            case .m_createCouch__couch_couch: return ".createCouch(couch:)"
            case .m_deleteCouch__id_id: return ".deleteCouch(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getAllCouches(willReturn: [Couch]...) -> MethodStub {
            return Given(method: .m_getAllCouches, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCouch(id: Parameter<String?>, willReturn: Couch?...) -> MethodStub {
            return Given(method: .m_getCouch__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createCouch(couch: Parameter<Couch>, willReturn: Couch...) -> MethodStub {
            return Given(method: .m_createCouch__couch_couch(`couch`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteCouch(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteCouch__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getAllCouches(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllCouches, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllCouches(willProduce: (StubberThrows<[Couch]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllCouches, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Couch]).self)
			willProduce(stubber)
			return given
        }
        public static func getCouch(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getCouch__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getCouch(id: Parameter<String?>, willProduce: (StubberThrows<Couch?>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getCouch__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Couch?).self)
			willProduce(stubber)
			return given
        }
        public static func createCouch(couch: Parameter<Couch>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createCouch__couch_couch(`couch`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createCouch(couch: Parameter<Couch>, willProduce: (StubberThrows<Couch>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createCouch__couch_couch(`couch`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Couch).self)
			willProduce(stubber)
			return given
        }
        public static func deleteCouch(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_deleteCouch__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func deleteCouch(id: Parameter<String?>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_deleteCouch__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getAllCouches() -> Verify { return Verify(method: .m_getAllCouches)}
        public static func getCouch(id: Parameter<String?>) -> Verify { return Verify(method: .m_getCouch__id_id(`id`))}
        public static func createCouch(couch: Parameter<Couch>) -> Verify { return Verify(method: .m_createCouch__couch_couch(`couch`))}
        public static func deleteCouch(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteCouch__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getAllCouches(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getAllCouches, performs: perform)
        }
        public static func getCouch(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getCouch__id_id(`id`), performs: perform)
        }
        public static func createCouch(couch: Parameter<Couch>, perform: @escaping (Couch) -> Void) -> Perform {
            return Perform(method: .m_createCouch__couch_couch(`couch`), performs: perform)
        }
        public static func deleteCouch(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteCouch__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - IHomeConfigurationService

open class IHomeConfigurationServiceMock: IHomeConfigurationService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getHomeConfigurations(couchId: String?) throws -> [HomeConfiguration] {
        addInvocation(.m_getHomeConfigurations__couchId_couchId(Parameter<String?>.value(`couchId`)))
		let perform = methodPerformValue(.m_getHomeConfigurations__couchId_couchId(Parameter<String?>.value(`couchId`))) as? (String?) -> Void
		perform?(`couchId`)
		var __value: [HomeConfiguration]
		do {
		    __value = try methodReturnValue(.m_getHomeConfigurations__couchId_couchId(Parameter<String?>.value(`couchId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getHomeConfigurations(couchId: String?). Use given")
			Failure("Stub return value not specified for getHomeConfigurations(couchId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func createHomeConfigurations(configuration: HomeConfiguration) throws -> HomeConfiguration {
        addInvocation(.m_createHomeConfigurations__configuration_configuration(Parameter<HomeConfiguration>.value(`configuration`)))
		let perform = methodPerformValue(.m_createHomeConfigurations__configuration_configuration(Parameter<HomeConfiguration>.value(`configuration`))) as? (HomeConfiguration) -> Void
		perform?(`configuration`)
		var __value: HomeConfiguration
		do {
		    __value = try methodReturnValue(.m_createHomeConfigurations__configuration_configuration(Parameter<HomeConfiguration>.value(`configuration`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createHomeConfigurations(configuration: HomeConfiguration). Use given")
			Failure("Stub return value not specified for createHomeConfigurations(configuration: HomeConfiguration). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func switchState(id: String?) throws -> HomeConfiguration {
        addInvocation(.m_switchState__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_switchState__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: HomeConfiguration
		do {
		    __value = try methodReturnValue(.m_switchState__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for switchState(id: String?). Use given")
			Failure("Stub return value not specified for switchState(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getHomeConfigurations__couchId_couchId(Parameter<String?>)
        case m_createHomeConfigurations__configuration_configuration(Parameter<HomeConfiguration>)
        case m_switchState__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getHomeConfigurations__couchId_couchId(let lhsCouchid), .m_getHomeConfigurations__couchId_couchId(let rhsCouchid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCouchid, rhs: rhsCouchid, with: matcher), lhsCouchid, rhsCouchid, "couchId"))
				return Matcher.ComparisonResult(results)

            case (.m_createHomeConfigurations__configuration_configuration(let lhsConfiguration), .m_createHomeConfigurations__configuration_configuration(let rhsConfiguration)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConfiguration, rhs: rhsConfiguration, with: matcher), lhsConfiguration, rhsConfiguration, "configuration"))
				return Matcher.ComparisonResult(results)

            case (.m_switchState__id_id(let lhsId), .m_switchState__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getHomeConfigurations__couchId_couchId(p0): return p0.intValue
            case let .m_createHomeConfigurations__configuration_configuration(p0): return p0.intValue
            case let .m_switchState__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getHomeConfigurations__couchId_couchId: return ".getHomeConfigurations(couchId:)"
            case .m_createHomeConfigurations__configuration_configuration: return ".createHomeConfigurations(configuration:)"
            case .m_switchState__id_id: return ".switchState(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getHomeConfigurations(couchId: Parameter<String?>, willReturn: [HomeConfiguration]...) -> MethodStub {
            return Given(method: .m_getHomeConfigurations__couchId_couchId(`couchId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, willReturn: HomeConfiguration...) -> MethodStub {
            return Given(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func switchState(id: Parameter<String?>, willReturn: HomeConfiguration...) -> MethodStub {
            return Given(method: .m_switchState__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getHomeConfigurations(couchId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getHomeConfigurations__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getHomeConfigurations(couchId: Parameter<String?>, willProduce: (StubberThrows<[HomeConfiguration]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getHomeConfigurations__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([HomeConfiguration]).self)
			willProduce(stubber)
			return given
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, willProduce: (StubberThrows<HomeConfiguration>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (HomeConfiguration).self)
			willProduce(stubber)
			return given
        }
        public static func switchState(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_switchState__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func switchState(id: Parameter<String?>, willProduce: (StubberThrows<HomeConfiguration>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_switchState__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (HomeConfiguration).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getHomeConfigurations(couchId: Parameter<String?>) -> Verify { return Verify(method: .m_getHomeConfigurations__couchId_couchId(`couchId`))}
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>) -> Verify { return Verify(method: .m_createHomeConfigurations__configuration_configuration(`configuration`))}
        public static func switchState(id: Parameter<String?>) -> Verify { return Verify(method: .m_switchState__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getHomeConfigurations(couchId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getHomeConfigurations__couchId_couchId(`couchId`), performs: perform)
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, perform: @escaping (HomeConfiguration) -> Void) -> Perform {
            return Perform(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), performs: perform)
        }
        public static func switchState(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_switchState__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - IMessageService

open class IMessageServiceMock: IMessageService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getMessages(conversationId: String?) throws -> [Message] {
        addInvocation(.m_getMessages__conversationId_conversationId(Parameter<String?>.value(`conversationId`)))
		let perform = methodPerformValue(.m_getMessages__conversationId_conversationId(Parameter<String?>.value(`conversationId`))) as? (String?) -> Void
		perform?(`conversationId`)
		var __value: [Message]
		do {
		    __value = try methodReturnValue(.m_getMessages__conversationId_conversationId(Parameter<String?>.value(`conversationId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getMessages(conversationId: String?). Use given")
			Failure("Stub return value not specified for getMessages(conversationId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func createMessage(message: Message) throws -> Message {
        addInvocation(.m_createMessage__message_message(Parameter<Message>.value(`message`)))
		let perform = methodPerformValue(.m_createMessage__message_message(Parameter<Message>.value(`message`))) as? (Message) -> Void
		perform?(`message`)
		var __value: Message
		do {
		    __value = try methodReturnValue(.m_createMessage__message_message(Parameter<Message>.value(`message`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createMessage(message: Message). Use given")
			Failure("Stub return value not specified for createMessage(message: Message). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func deleteMessage(id: String?) throws -> Bool {
        addInvocation(.m_deleteMessage__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_deleteMessage__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteMessage__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for deleteMessage(id: String?). Use given")
			Failure("Stub return value not specified for deleteMessage(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getMessages__conversationId_conversationId(Parameter<String?>)
        case m_createMessage__message_message(Parameter<Message>)
        case m_deleteMessage__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getMessages__conversationId_conversationId(let lhsConversationid), .m_getMessages__conversationId_conversationId(let rhsConversationid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConversationid, rhs: rhsConversationid, with: matcher), lhsConversationid, rhsConversationid, "conversationId"))
				return Matcher.ComparisonResult(results)

            case (.m_createMessage__message_message(let lhsMessage), .m_createMessage__message_message(let rhsMessage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMessage, rhs: rhsMessage, with: matcher), lhsMessage, rhsMessage, "message"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteMessage__id_id(let lhsId), .m_deleteMessage__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getMessages__conversationId_conversationId(p0): return p0.intValue
            case let .m_createMessage__message_message(p0): return p0.intValue
            case let .m_deleteMessage__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getMessages__conversationId_conversationId: return ".getMessages(conversationId:)"
            case .m_createMessage__message_message: return ".createMessage(message:)"
            case .m_deleteMessage__id_id: return ".deleteMessage(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getMessages(conversationId: Parameter<String?>, willReturn: [Message]...) -> MethodStub {
            return Given(method: .m_getMessages__conversationId_conversationId(`conversationId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createMessage(message: Parameter<Message>, willReturn: Message...) -> MethodStub {
            return Given(method: .m_createMessage__message_message(`message`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteMessage(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteMessage__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getMessages(conversationId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getMessages__conversationId_conversationId(`conversationId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getMessages(conversationId: Parameter<String?>, willProduce: (StubberThrows<[Message]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getMessages__conversationId_conversationId(`conversationId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Message]).self)
			willProduce(stubber)
			return given
        }
        public static func createMessage(message: Parameter<Message>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createMessage__message_message(`message`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createMessage(message: Parameter<Message>, willProduce: (StubberThrows<Message>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createMessage__message_message(`message`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Message).self)
			willProduce(stubber)
			return given
        }
        public static func deleteMessage(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_deleteMessage__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func deleteMessage(id: Parameter<String?>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_deleteMessage__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getMessages(conversationId: Parameter<String?>) -> Verify { return Verify(method: .m_getMessages__conversationId_conversationId(`conversationId`))}
        public static func createMessage(message: Parameter<Message>) -> Verify { return Verify(method: .m_createMessage__message_message(`message`))}
        public static func deleteMessage(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteMessage__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getMessages(conversationId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getMessages__conversationId_conversationId(`conversationId`), performs: perform)
        }
        public static func createMessage(message: Parameter<Message>, perform: @escaping (Message) -> Void) -> Perform {
            return Perform(method: .m_createMessage__message_message(`message`), performs: perform)
        }
        public static func deleteMessage(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteMessage__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - IRatingService

open class IRatingServiceMock: IRatingService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getRatings(couchId: String?) throws -> [Rating] {
        addInvocation(.m_getRatings__couchId_couchId(Parameter<String?>.value(`couchId`)))
		let perform = methodPerformValue(.m_getRatings__couchId_couchId(Parameter<String?>.value(`couchId`))) as? (String?) -> Void
		perform?(`couchId`)
		var __value: [Rating]
		do {
		    __value = try methodReturnValue(.m_getRatings__couchId_couchId(Parameter<String?>.value(`couchId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getRatings(couchId: String?). Use given")
			Failure("Stub return value not specified for getRatings(couchId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func createRating(rating: Rating) throws -> Rating {
        addInvocation(.m_createRating__rating_rating(Parameter<Rating>.value(`rating`)))
		let perform = methodPerformValue(.m_createRating__rating_rating(Parameter<Rating>.value(`rating`))) as? (Rating) -> Void
		perform?(`rating`)
		var __value: Rating
		do {
		    __value = try methodReturnValue(.m_createRating__rating_rating(Parameter<Rating>.value(`rating`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createRating(rating: Rating). Use given")
			Failure("Stub return value not specified for createRating(rating: Rating). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func deleteRating(id: String?) throws -> Bool {
        addInvocation(.m_deleteRating__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_deleteRating__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteRating__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for deleteRating(id: String?). Use given")
			Failure("Stub return value not specified for deleteRating(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getRatings__couchId_couchId(Parameter<String?>)
        case m_createRating__rating_rating(Parameter<Rating>)
        case m_deleteRating__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getRatings__couchId_couchId(let lhsCouchid), .m_getRatings__couchId_couchId(let rhsCouchid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCouchid, rhs: rhsCouchid, with: matcher), lhsCouchid, rhsCouchid, "couchId"))
				return Matcher.ComparisonResult(results)

            case (.m_createRating__rating_rating(let lhsRating), .m_createRating__rating_rating(let rhsRating)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRating, rhs: rhsRating, with: matcher), lhsRating, rhsRating, "rating"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteRating__id_id(let lhsId), .m_deleteRating__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getRatings__couchId_couchId(p0): return p0.intValue
            case let .m_createRating__rating_rating(p0): return p0.intValue
            case let .m_deleteRating__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getRatings__couchId_couchId: return ".getRatings(couchId:)"
            case .m_createRating__rating_rating: return ".createRating(rating:)"
            case .m_deleteRating__id_id: return ".deleteRating(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getRatings(couchId: Parameter<String?>, willReturn: [Rating]...) -> MethodStub {
            return Given(method: .m_getRatings__couchId_couchId(`couchId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createRating(rating: Parameter<Rating>, willReturn: Rating...) -> MethodStub {
            return Given(method: .m_createRating__rating_rating(`rating`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteRating(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteRating__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getRatings(couchId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getRatings__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getRatings(couchId: Parameter<String?>, willProduce: (StubberThrows<[Rating]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getRatings__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Rating]).self)
			willProduce(stubber)
			return given
        }
        public static func createRating(rating: Parameter<Rating>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createRating__rating_rating(`rating`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createRating(rating: Parameter<Rating>, willProduce: (StubberThrows<Rating>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createRating__rating_rating(`rating`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Rating).self)
			willProduce(stubber)
			return given
        }
        public static func deleteRating(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_deleteRating__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func deleteRating(id: Parameter<String?>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_deleteRating__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getRatings(couchId: Parameter<String?>) -> Verify { return Verify(method: .m_getRatings__couchId_couchId(`couchId`))}
        public static func createRating(rating: Parameter<Rating>) -> Verify { return Verify(method: .m_createRating__rating_rating(`rating`))}
        public static func deleteRating(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteRating__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getRatings(couchId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getRatings__couchId_couchId(`couchId`), performs: perform)
        }
        public static func createRating(rating: Parameter<Rating>, perform: @escaping (Rating) -> Void) -> Perform {
            return Perform(method: .m_createRating__rating_rating(`rating`), performs: perform)
        }
        public static func deleteRating(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteRating__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - IUserService

open class IUserServiceMock: IUserService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getAllUsers() throws -> [User] {
        addInvocation(.m_getAllUsers)
		let perform = methodPerformValue(.m_getAllUsers) as? () -> Void
		perform?()
		var __value: [User]
		do {
		    __value = try methodReturnValue(.m_getAllUsers).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllUsers(). Use given")
			Failure("Stub return value not specified for getAllUsers(). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getUser(id: String?) throws -> User? {
        addInvocation(.m_getUser__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_getUser__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: User? = nil
		do {
		    __value = try methodReturnValue(.m_getUser__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
		return __value
    }

    open func createUser(user: User) throws -> User {
        addInvocation(.m_createUser__user_user(Parameter<User>.value(`user`)))
		let perform = methodPerformValue(.m_createUser__user_user(Parameter<User>.value(`user`))) as? (User) -> Void
		perform?(`user`)
		var __value: User
		do {
		    __value = try methodReturnValue(.m_createUser__user_user(Parameter<User>.value(`user`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createUser(user: User). Use given")
			Failure("Stub return value not specified for createUser(user: User). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func deleteUser(id: String?) throws -> Bool {
        addInvocation(.m_deleteUser__id_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_deleteUser__id_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteUser__id_id(Parameter<String?>.value(`id`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for deleteUser(id: String?). Use given")
			Failure("Stub return value not specified for deleteUser(id: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getAllUsers
        case m_getUser__id_id(Parameter<String?>)
        case m_createUser__user_user(Parameter<User>)
        case m_deleteUser__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getAllUsers, .m_getAllUsers): return .match

            case (.m_getUser__id_id(let lhsId), .m_getUser__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_createUser__user_user(let lhsUser), .m_createUser__user_user(let rhsUser)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher), lhsUser, rhsUser, "user"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteUser__id_id(let lhsId), .m_deleteUser__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getAllUsers: return 0
            case let .m_getUser__id_id(p0): return p0.intValue
            case let .m_createUser__user_user(p0): return p0.intValue
            case let .m_deleteUser__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getAllUsers: return ".getAllUsers()"
            case .m_getUser__id_id: return ".getUser(id:)"
            case .m_createUser__user_user: return ".createUser(user:)"
            case .m_deleteUser__id_id: return ".deleteUser(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getAllUsers(willReturn: [User]...) -> MethodStub {
            return Given(method: .m_getAllUsers, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getUser(id: Parameter<String?>, willReturn: User?...) -> MethodStub {
            return Given(method: .m_getUser__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createUser(user: Parameter<User>, willReturn: User...) -> MethodStub {
            return Given(method: .m_createUser__user_user(`user`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteUser(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteUser__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getAllUsers(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllUsers, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllUsers(willProduce: (StubberThrows<[User]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllUsers, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([User]).self)
			willProduce(stubber)
			return given
        }
        public static func getUser(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getUser__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getUser(id: Parameter<String?>, willProduce: (StubberThrows<User?>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getUser__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (User?).self)
			willProduce(stubber)
			return given
        }
        public static func createUser(user: Parameter<User>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createUser(user: Parameter<User>, willProduce: (StubberThrows<User>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (User).self)
			willProduce(stubber)
			return given
        }
        public static func deleteUser(id: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_deleteUser__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func deleteUser(id: Parameter<String?>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_deleteUser__id_id(`id`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getAllUsers() -> Verify { return Verify(method: .m_getAllUsers)}
        public static func getUser(id: Parameter<String?>) -> Verify { return Verify(method: .m_getUser__id_id(`id`))}
        public static func createUser(user: Parameter<User>) -> Verify { return Verify(method: .m_createUser__user_user(`user`))}
        public static func deleteUser(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteUser__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getAllUsers(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getAllUsers, performs: perform)
        }
        public static func getUser(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getUser__id_id(`id`), performs: perform)
        }
        public static func createUser(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_createUser__user_user(`user`), performs: perform)
        }
        public static func deleteUser(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteUser__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

