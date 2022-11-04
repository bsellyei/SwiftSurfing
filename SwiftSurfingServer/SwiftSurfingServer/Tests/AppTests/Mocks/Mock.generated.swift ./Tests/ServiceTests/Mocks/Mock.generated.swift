// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.2.0
// Required Sourcery: 1.8.0


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

    open func createConversation(conversation: Conversation, users: [User]) throws -> Conversation {
        addInvocation(.m_createConversation__conversation_conversationusers_users(Parameter<Conversation>.value(`conversation`), Parameter<[User]>.value(`users`)))
		let perform = methodPerformValue(.m_createConversation__conversation_conversationusers_users(Parameter<Conversation>.value(`conversation`), Parameter<[User]>.value(`users`))) as? (Conversation, [User]) -> Void
		perform?(`conversation`, `users`)
		var __value: Conversation
		do {
		    __value = try methodReturnValue(.m_createConversation__conversation_conversationusers_users(Parameter<Conversation>.value(`conversation`), Parameter<[User]>.value(`users`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createConversation(conversation: Conversation, users: [User]). Use given")
			Failure("Stub return value not specified for createConversation(conversation: Conversation, users: [User]). Use given")
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


    fileprivate enum MethodType {
        case m_getConversations__user_user(Parameter<User>)
        case m_createConversation__conversation_conversationusers_users(Parameter<Conversation>, Parameter<[User]>)
        case m_deleteConversation__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getConversations__user_user(let lhsUser), .m_getConversations__user_user(let rhsUser)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher), lhsUser, rhsUser, "user"))
				return Matcher.ComparisonResult(results)

            case (.m_createConversation__conversation_conversationusers_users(let lhsConversation, let lhsUsers), .m_createConversation__conversation_conversationusers_users(let rhsConversation, let rhsUsers)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConversation, rhs: rhsConversation, with: matcher), lhsConversation, rhsConversation, "conversation"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUsers, rhs: rhsUsers, with: matcher), lhsUsers, rhsUsers, "users"))
				return Matcher.ComparisonResult(results)

            case (.m_deleteConversation__id_id(let lhsId), .m_deleteConversation__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getConversations__user_user(p0): return p0.intValue
            case let .m_createConversation__conversation_conversationusers_users(p0, p1): return p0.intValue + p1.intValue
            case let .m_deleteConversation__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getConversations__user_user: return ".getConversations(user:)"
            case .m_createConversation__conversation_conversationusers_users: return ".createConversation(conversation:users:)"
            case .m_deleteConversation__id_id: return ".deleteConversation(id:)"
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
        public static func createConversation(conversation: Parameter<Conversation>, users: Parameter<[User]>, willReturn: Conversation...) -> MethodStub {
            return Given(method: .m_createConversation__conversation_conversationusers_users(`conversation`, `users`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func deleteConversation(id: Parameter<String?>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteConversation__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
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
        public static func createConversation(conversation: Parameter<Conversation>, users: Parameter<[User]>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createConversation__conversation_conversationusers_users(`conversation`, `users`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createConversation(conversation: Parameter<Conversation>, users: Parameter<[User]>, willProduce: (StubberThrows<Conversation>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createConversation__conversation_conversationusers_users(`conversation`, `users`), products: willThrow.map({ StubProduct.throw($0) })) }()
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
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getConversations(user: Parameter<User>) -> Verify { return Verify(method: .m_getConversations__user_user(`user`))}
        public static func createConversation(conversation: Parameter<Conversation>, users: Parameter<[User]>) -> Verify { return Verify(method: .m_createConversation__conversation_conversationusers_users(`conversation`, `users`))}
        public static func deleteConversation(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteConversation__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getConversations(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_getConversations__user_user(`user`), performs: perform)
        }
        public static func createConversation(conversation: Parameter<Conversation>, users: Parameter<[User]>, perform: @escaping (Conversation, [User]) -> Void) -> Perform {
            return Perform(method: .m_createConversation__conversation_conversationusers_users(`conversation`, `users`), performs: perform)
        }
        public static func deleteConversation(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_deleteConversation__id_id(`id`), performs: perform)
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





    open func getAllCouchesForUser(userId: String?) throws -> [Couch] {
        addInvocation(.m_getAllCouchesForUser__userId_userId(Parameter<String?>.value(`userId`)))
		let perform = methodPerformValue(.m_getAllCouchesForUser__userId_userId(Parameter<String?>.value(`userId`))) as? (String?) -> Void
		perform?(`userId`)
		var __value: [Couch]
		do {
		    __value = try methodReturnValue(.m_getAllCouchesForUser__userId_userId(Parameter<String?>.value(`userId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllCouchesForUser(userId: String?). Use given")
			Failure("Stub return value not specified for getAllCouchesForUser(userId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getAllCouchesByCityExcludeUser(city: String?, userId: String?) throws -> [Couch] {
        addInvocation(.m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(Parameter<String?>.value(`city`), Parameter<String?>.value(`userId`)))
		let perform = methodPerformValue(.m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(Parameter<String?>.value(`city`), Parameter<String?>.value(`userId`))) as? (String?, String?) -> Void
		perform?(`city`, `userId`)
		var __value: [Couch]
		do {
		    __value = try methodReturnValue(.m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(Parameter<String?>.value(`city`), Parameter<String?>.value(`userId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllCouchesByCityExcludeUser(city: String?, userId: String?). Use given")
			Failure("Stub return value not specified for getAllCouchesByCityExcludeUser(city: String?, userId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getAllCouchesByCity(city: String?) throws -> [Couch] {
        addInvocation(.m_getAllCouchesByCity__city_city(Parameter<String?>.value(`city`)))
		let perform = methodPerformValue(.m_getAllCouchesByCity__city_city(Parameter<String?>.value(`city`))) as? (String?) -> Void
		perform?(`city`)
		var __value: [Couch]
		do {
		    __value = try methodReturnValue(.m_getAllCouchesByCity__city_city(Parameter<String?>.value(`city`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllCouchesByCity(city: String?). Use given")
			Failure("Stub return value not specified for getAllCouchesByCity(city: String?). Use given")
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
        case m_getAllCouchesForUser__userId_userId(Parameter<String?>)
        case m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(Parameter<String?>, Parameter<String?>)
        case m_getAllCouchesByCity__city_city(Parameter<String?>)
        case m_getCouch__id_id(Parameter<String?>)
        case m_createCouch__couch_couch(Parameter<Couch>)
        case m_deleteCouch__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getAllCouchesForUser__userId_userId(let lhsUserid), .m_getAllCouchesForUser__userId_userId(let rhsUserid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUserid, rhs: rhsUserid, with: matcher), lhsUserid, rhsUserid, "userId"))
				return Matcher.ComparisonResult(results)

            case (.m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(let lhsCity, let lhsUserid), .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(let rhsCity, let rhsUserid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCity, rhs: rhsCity, with: matcher), lhsCity, rhsCity, "city"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUserid, rhs: rhsUserid, with: matcher), lhsUserid, rhsUserid, "userId"))
				return Matcher.ComparisonResult(results)

            case (.m_getAllCouchesByCity__city_city(let lhsCity), .m_getAllCouchesByCity__city_city(let rhsCity)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCity, rhs: rhsCity, with: matcher), lhsCity, rhsCity, "city"))
				return Matcher.ComparisonResult(results)

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
            case let .m_getAllCouchesForUser__userId_userId(p0): return p0.intValue
            case let .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(p0, p1): return p0.intValue + p1.intValue
            case let .m_getAllCouchesByCity__city_city(p0): return p0.intValue
            case let .m_getCouch__id_id(p0): return p0.intValue
            case let .m_createCouch__couch_couch(p0): return p0.intValue
            case let .m_deleteCouch__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getAllCouchesForUser__userId_userId: return ".getAllCouchesForUser(userId:)"
            case .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId: return ".getAllCouchesByCityExcludeUser(city:userId:)"
            case .m_getAllCouchesByCity__city_city: return ".getAllCouchesByCity(city:)"
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


        public static func getAllCouchesForUser(userId: Parameter<String?>, willReturn: [Couch]...) -> MethodStub {
            return Given(method: .m_getAllCouchesForUser__userId_userId(`userId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getAllCouchesByCityExcludeUser(city: Parameter<String?>, userId: Parameter<String?>, willReturn: [Couch]...) -> MethodStub {
            return Given(method: .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(`city`, `userId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getAllCouchesByCity(city: Parameter<String?>, willReturn: [Couch]...) -> MethodStub {
            return Given(method: .m_getAllCouchesByCity__city_city(`city`), products: willReturn.map({ StubProduct.return($0 as Any) }))
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
        public static func getAllCouchesForUser(userId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllCouchesForUser__userId_userId(`userId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllCouchesForUser(userId: Parameter<String?>, willProduce: (StubberThrows<[Couch]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllCouchesForUser__userId_userId(`userId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Couch]).self)
			willProduce(stubber)
			return given
        }
        public static func getAllCouchesByCityExcludeUser(city: Parameter<String?>, userId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(`city`, `userId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllCouchesByCityExcludeUser(city: Parameter<String?>, userId: Parameter<String?>, willProduce: (StubberThrows<[Couch]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(`city`, `userId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Couch]).self)
			willProduce(stubber)
			return given
        }
        public static func getAllCouchesByCity(city: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllCouchesByCity__city_city(`city`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllCouchesByCity(city: Parameter<String?>, willProduce: (StubberThrows<[Couch]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllCouchesByCity__city_city(`city`), products: willThrow.map({ StubProduct.throw($0) })) }()
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

        public static func getAllCouchesForUser(userId: Parameter<String?>) -> Verify { return Verify(method: .m_getAllCouchesForUser__userId_userId(`userId`))}
        public static func getAllCouchesByCityExcludeUser(city: Parameter<String?>, userId: Parameter<String?>) -> Verify { return Verify(method: .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(`city`, `userId`))}
        public static func getAllCouchesByCity(city: Parameter<String?>) -> Verify { return Verify(method: .m_getAllCouchesByCity__city_city(`city`))}
        public static func getCouch(id: Parameter<String?>) -> Verify { return Verify(method: .m_getCouch__id_id(`id`))}
        public static func createCouch(couch: Parameter<Couch>) -> Verify { return Verify(method: .m_createCouch__couch_couch(`couch`))}
        public static func deleteCouch(id: Parameter<String?>) -> Verify { return Verify(method: .m_deleteCouch__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getAllCouchesForUser(userId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getAllCouchesForUser__userId_userId(`userId`), performs: perform)
        }
        public static func getAllCouchesByCityExcludeUser(city: Parameter<String?>, userId: Parameter<String?>, perform: @escaping (String?, String?) -> Void) -> Perform {
            return Perform(method: .m_getAllCouchesByCityExcludeUser__city_cityuserId_userId(`city`, `userId`), performs: perform)
        }
        public static func getAllCouchesByCity(city: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getAllCouchesByCity__city_city(`city`), performs: perform)
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

// MARK: - IExternalHomeService

open class IExternalHomeServiceMock: IExternalHomeService, Mock {
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





    open func getAllThings() throws -> [Thing] {
        addInvocation(.m_getAllThings)
		let perform = methodPerformValue(.m_getAllThings) as? () -> Void
		perform?()
		var __value: [Thing]
		do {
		    __value = try methodReturnValue(.m_getAllThings).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getAllThings(). Use given")
			Failure("Stub return value not specified for getAllThings(). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getItem(name: String) throws -> Item {
        addInvocation(.m_getItem__name_name(Parameter<String>.value(`name`)))
		let perform = methodPerformValue(.m_getItem__name_name(Parameter<String>.value(`name`))) as? (String) -> Void
		perform?(`name`)
		var __value: Item
		do {
		    __value = try methodReturnValue(.m_getItem__name_name(Parameter<String>.value(`name`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getItem(name: String). Use given")
			Failure("Stub return value not specified for getItem(name: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func setItemState(name: String, newState: String) throws -> Bool {
        addInvocation(.m_setItemState__name_namenewState_newState(Parameter<String>.value(`name`), Parameter<String>.value(`newState`)))
		let perform = methodPerformValue(.m_setItemState__name_namenewState_newState(Parameter<String>.value(`name`), Parameter<String>.value(`newState`))) as? (String, String) -> Void
		perform?(`name`, `newState`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_setItemState__name_namenewState_newState(Parameter<String>.value(`name`), Parameter<String>.value(`newState`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for setItemState(name: String, newState: String). Use given")
			Failure("Stub return value not specified for setItemState(name: String, newState: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func addItem(name: String, label: String, type: String) throws -> Item {
        addInvocation(.m_addItem__name_namelabel_labeltype_type(Parameter<String>.value(`name`), Parameter<String>.value(`label`), Parameter<String>.value(`type`)))
		let perform = methodPerformValue(.m_addItem__name_namelabel_labeltype_type(Parameter<String>.value(`name`), Parameter<String>.value(`label`), Parameter<String>.value(`type`))) as? (String, String, String) -> Void
		perform?(`name`, `label`, `type`)
		var __value: Item
		do {
		    __value = try methodReturnValue(.m_addItem__name_namelabel_labeltype_type(Parameter<String>.value(`name`), Parameter<String>.value(`label`), Parameter<String>.value(`type`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for addItem(name: String, label: String, type: String). Use given")
			Failure("Stub return value not specified for addItem(name: String, label: String, type: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func linkItemToChannel(itemName: String, channelId: String) throws -> Bool {
        addInvocation(.m_linkItemToChannel__itemName_itemNamechannelId_channelId(Parameter<String>.value(`itemName`), Parameter<String>.value(`channelId`)))
		let perform = methodPerformValue(.m_linkItemToChannel__itemName_itemNamechannelId_channelId(Parameter<String>.value(`itemName`), Parameter<String>.value(`channelId`))) as? (String, String) -> Void
		perform?(`itemName`, `channelId`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_linkItemToChannel__itemName_itemNamechannelId_channelId(Parameter<String>.value(`itemName`), Parameter<String>.value(`channelId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for linkItemToChannel(itemName: String, channelId: String). Use given")
			Failure("Stub return value not specified for linkItemToChannel(itemName: String, channelId: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getAllThings
        case m_getItem__name_name(Parameter<String>)
        case m_setItemState__name_namenewState_newState(Parameter<String>, Parameter<String>)
        case m_addItem__name_namelabel_labeltype_type(Parameter<String>, Parameter<String>, Parameter<String>)
        case m_linkItemToChannel__itemName_itemNamechannelId_channelId(Parameter<String>, Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getAllThings, .m_getAllThings): return .match

            case (.m_getItem__name_name(let lhsName), .m_getItem__name_name(let rhsName)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher), lhsName, rhsName, "name"))
				return Matcher.ComparisonResult(results)

            case (.m_setItemState__name_namenewState_newState(let lhsName, let lhsNewstate), .m_setItemState__name_namenewState_newState(let rhsName, let rhsNewstate)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher), lhsName, rhsName, "name"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNewstate, rhs: rhsNewstate, with: matcher), lhsNewstate, rhsNewstate, "newState"))
				return Matcher.ComparisonResult(results)

            case (.m_addItem__name_namelabel_labeltype_type(let lhsName, let lhsLabel, let lhsType), .m_addItem__name_namelabel_labeltype_type(let rhsName, let rhsLabel, let rhsType)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher), lhsName, rhsName, "name"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLabel, rhs: rhsLabel, with: matcher), lhsLabel, rhsLabel, "label"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher), lhsType, rhsType, "type"))
				return Matcher.ComparisonResult(results)

            case (.m_linkItemToChannel__itemName_itemNamechannelId_channelId(let lhsItemname, let lhsChannelid), .m_linkItemToChannel__itemName_itemNamechannelId_channelId(let rhsItemname, let rhsChannelid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsItemname, rhs: rhsItemname, with: matcher), lhsItemname, rhsItemname, "itemName"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsChannelid, rhs: rhsChannelid, with: matcher), lhsChannelid, rhsChannelid, "channelId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getAllThings: return 0
            case let .m_getItem__name_name(p0): return p0.intValue
            case let .m_setItemState__name_namenewState_newState(p0, p1): return p0.intValue + p1.intValue
            case let .m_addItem__name_namelabel_labeltype_type(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_linkItemToChannel__itemName_itemNamechannelId_channelId(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getAllThings: return ".getAllThings()"
            case .m_getItem__name_name: return ".getItem(name:)"
            case .m_setItemState__name_namenewState_newState: return ".setItemState(name:newState:)"
            case .m_addItem__name_namelabel_labeltype_type: return ".addItem(name:label:type:)"
            case .m_linkItemToChannel__itemName_itemNamechannelId_channelId: return ".linkItemToChannel(itemName:channelId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getAllThings(willReturn: [Thing]...) -> MethodStub {
            return Given(method: .m_getAllThings, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getItem(name: Parameter<String>, willReturn: Item...) -> MethodStub {
            return Given(method: .m_getItem__name_name(`name`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func setItemState(name: Parameter<String>, newState: Parameter<String>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_setItemState__name_namenewState_newState(`name`, `newState`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func addItem(name: Parameter<String>, label: Parameter<String>, type: Parameter<String>, willReturn: Item...) -> MethodStub {
            return Given(method: .m_addItem__name_namelabel_labeltype_type(`name`, `label`, `type`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func linkItemToChannel(itemName: Parameter<String>, channelId: Parameter<String>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_linkItemToChannel__itemName_itemNamechannelId_channelId(`itemName`, `channelId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getAllThings(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getAllThings, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getAllThings(willProduce: (StubberThrows<[Thing]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getAllThings, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Thing]).self)
			willProduce(stubber)
			return given
        }
        public static func getItem(name: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getItem__name_name(`name`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getItem(name: Parameter<String>, willProduce: (StubberThrows<Item>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getItem__name_name(`name`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Item).self)
			willProduce(stubber)
			return given
        }
        public static func setItemState(name: Parameter<String>, newState: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_setItemState__name_namenewState_newState(`name`, `newState`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func setItemState(name: Parameter<String>, newState: Parameter<String>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_setItemState__name_namenewState_newState(`name`, `newState`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func addItem(name: Parameter<String>, label: Parameter<String>, type: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_addItem__name_namelabel_labeltype_type(`name`, `label`, `type`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func addItem(name: Parameter<String>, label: Parameter<String>, type: Parameter<String>, willProduce: (StubberThrows<Item>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_addItem__name_namelabel_labeltype_type(`name`, `label`, `type`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Item).self)
			willProduce(stubber)
			return given
        }
        public static func linkItemToChannel(itemName: Parameter<String>, channelId: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_linkItemToChannel__itemName_itemNamechannelId_channelId(`itemName`, `channelId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func linkItemToChannel(itemName: Parameter<String>, channelId: Parameter<String>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_linkItemToChannel__itemName_itemNamechannelId_channelId(`itemName`, `channelId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getAllThings() -> Verify { return Verify(method: .m_getAllThings)}
        public static func getItem(name: Parameter<String>) -> Verify { return Verify(method: .m_getItem__name_name(`name`))}
        public static func setItemState(name: Parameter<String>, newState: Parameter<String>) -> Verify { return Verify(method: .m_setItemState__name_namenewState_newState(`name`, `newState`))}
        public static func addItem(name: Parameter<String>, label: Parameter<String>, type: Parameter<String>) -> Verify { return Verify(method: .m_addItem__name_namelabel_labeltype_type(`name`, `label`, `type`))}
        public static func linkItemToChannel(itemName: Parameter<String>, channelId: Parameter<String>) -> Verify { return Verify(method: .m_linkItemToChannel__itemName_itemNamechannelId_channelId(`itemName`, `channelId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getAllThings(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getAllThings, performs: perform)
        }
        public static func getItem(name: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getItem__name_name(`name`), performs: perform)
        }
        public static func setItemState(name: Parameter<String>, newState: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .m_setItemState__name_namenewState_newState(`name`, `newState`), performs: perform)
        }
        public static func addItem(name: Parameter<String>, label: Parameter<String>, type: Parameter<String>, perform: @escaping (String, String, String) -> Void) -> Perform {
            return Perform(method: .m_addItem__name_namelabel_labeltype_type(`name`, `label`, `type`), performs: perform)
        }
        public static func linkItemToChannel(itemName: Parameter<String>, channelId: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .m_linkItemToChannel__itemName_itemNamechannelId_channelId(`itemName`, `channelId`), performs: perform)
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

    open func getHomeConfiguration(configurationId: String?) throws -> HomeConfiguration? {
        addInvocation(.m_getHomeConfiguration__configurationId_configurationId(Parameter<String?>.value(`configurationId`)))
		let perform = methodPerformValue(.m_getHomeConfiguration__configurationId_configurationId(Parameter<String?>.value(`configurationId`))) as? (String?) -> Void
		perform?(`configurationId`)
		var __value: HomeConfiguration? = nil
		do {
		    __value = try methodReturnValue(.m_getHomeConfiguration__configurationId_configurationId(Parameter<String?>.value(`configurationId`))).casted()
		} catch MockError.notStubed {
			// do nothing
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

    open func getHomeConfigurationsByType(type: ConfigurationType, state: State) throws -> [HomeConfiguration] {
        addInvocation(.m_getHomeConfigurationsByType__type_typestate_state(Parameter<ConfigurationType>.value(`type`), Parameter<State>.value(`state`)))
		let perform = methodPerformValue(.m_getHomeConfigurationsByType__type_typestate_state(Parameter<ConfigurationType>.value(`type`), Parameter<State>.value(`state`))) as? (ConfigurationType, State) -> Void
		perform?(`type`, `state`)
		var __value: [HomeConfiguration]
		do {
		    __value = try methodReturnValue(.m_getHomeConfigurationsByType__type_typestate_state(Parameter<ConfigurationType>.value(`type`), Parameter<State>.value(`state`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getHomeConfigurationsByType(type: ConfigurationType, state: State). Use given")
			Failure("Stub return value not specified for getHomeConfigurationsByType(type: ConfigurationType, state: State). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getHomeConfigurations__couchId_couchId(Parameter<String?>)
        case m_getHomeConfiguration__configurationId_configurationId(Parameter<String?>)
        case m_createHomeConfigurations__configuration_configuration(Parameter<HomeConfiguration>)
        case m_switchState__id_id(Parameter<String?>)
        case m_getHomeConfigurationsByType__type_typestate_state(Parameter<ConfigurationType>, Parameter<State>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getHomeConfigurations__couchId_couchId(let lhsCouchid), .m_getHomeConfigurations__couchId_couchId(let rhsCouchid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCouchid, rhs: rhsCouchid, with: matcher), lhsCouchid, rhsCouchid, "couchId"))
				return Matcher.ComparisonResult(results)

            case (.m_getHomeConfiguration__configurationId_configurationId(let lhsConfigurationid), .m_getHomeConfiguration__configurationId_configurationId(let rhsConfigurationid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConfigurationid, rhs: rhsConfigurationid, with: matcher), lhsConfigurationid, rhsConfigurationid, "configurationId"))
				return Matcher.ComparisonResult(results)

            case (.m_createHomeConfigurations__configuration_configuration(let lhsConfiguration), .m_createHomeConfigurations__configuration_configuration(let rhsConfiguration)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsConfiguration, rhs: rhsConfiguration, with: matcher), lhsConfiguration, rhsConfiguration, "configuration"))
				return Matcher.ComparisonResult(results)

            case (.m_switchState__id_id(let lhsId), .m_switchState__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_getHomeConfigurationsByType__type_typestate_state(let lhsType, let lhsState), .m_getHomeConfigurationsByType__type_typestate_state(let rhsType, let rhsState)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher), lhsType, rhsType, "type"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsState, rhs: rhsState, with: matcher), lhsState, rhsState, "state"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getHomeConfigurations__couchId_couchId(p0): return p0.intValue
            case let .m_getHomeConfiguration__configurationId_configurationId(p0): return p0.intValue
            case let .m_createHomeConfigurations__configuration_configuration(p0): return p0.intValue
            case let .m_switchState__id_id(p0): return p0.intValue
            case let .m_getHomeConfigurationsByType__type_typestate_state(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getHomeConfigurations__couchId_couchId: return ".getHomeConfigurations(couchId:)"
            case .m_getHomeConfiguration__configurationId_configurationId: return ".getHomeConfiguration(configurationId:)"
            case .m_createHomeConfigurations__configuration_configuration: return ".createHomeConfigurations(configuration:)"
            case .m_switchState__id_id: return ".switchState(id:)"
            case .m_getHomeConfigurationsByType__type_typestate_state: return ".getHomeConfigurationsByType(type:state:)"
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
        public static func getHomeConfiguration(configurationId: Parameter<String?>, willReturn: HomeConfiguration?...) -> MethodStub {
            return Given(method: .m_getHomeConfiguration__configurationId_configurationId(`configurationId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, willReturn: HomeConfiguration...) -> MethodStub {
            return Given(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func switchState(id: Parameter<String?>, willReturn: HomeConfiguration...) -> MethodStub {
            return Given(method: .m_switchState__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getHomeConfigurationsByType(type: Parameter<ConfigurationType>, state: Parameter<State>, willReturn: [HomeConfiguration]...) -> MethodStub {
            return Given(method: .m_getHomeConfigurationsByType__type_typestate_state(`type`, `state`), products: willReturn.map({ StubProduct.return($0 as Any) }))
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
        public static func getHomeConfiguration(configurationId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getHomeConfiguration__configurationId_configurationId(`configurationId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getHomeConfiguration(configurationId: Parameter<String?>, willProduce: (StubberThrows<HomeConfiguration?>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getHomeConfiguration__configurationId_configurationId(`configurationId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (HomeConfiguration?).self)
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
        public static func getHomeConfigurationsByType(type: Parameter<ConfigurationType>, state: Parameter<State>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getHomeConfigurationsByType__type_typestate_state(`type`, `state`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getHomeConfigurationsByType(type: Parameter<ConfigurationType>, state: Parameter<State>, willProduce: (StubberThrows<[HomeConfiguration]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getHomeConfigurationsByType__type_typestate_state(`type`, `state`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([HomeConfiguration]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getHomeConfigurations(couchId: Parameter<String?>) -> Verify { return Verify(method: .m_getHomeConfigurations__couchId_couchId(`couchId`))}
        public static func getHomeConfiguration(configurationId: Parameter<String?>) -> Verify { return Verify(method: .m_getHomeConfiguration__configurationId_configurationId(`configurationId`))}
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>) -> Verify { return Verify(method: .m_createHomeConfigurations__configuration_configuration(`configuration`))}
        public static func switchState(id: Parameter<String?>) -> Verify { return Verify(method: .m_switchState__id_id(`id`))}
        public static func getHomeConfigurationsByType(type: Parameter<ConfigurationType>, state: Parameter<State>) -> Verify { return Verify(method: .m_getHomeConfigurationsByType__type_typestate_state(`type`, `state`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getHomeConfigurations(couchId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getHomeConfigurations__couchId_couchId(`couchId`), performs: perform)
        }
        public static func getHomeConfiguration(configurationId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getHomeConfiguration__configurationId_configurationId(`configurationId`), performs: perform)
        }
        public static func createHomeConfigurations(configuration: Parameter<HomeConfiguration>, perform: @escaping (HomeConfiguration) -> Void) -> Perform {
            return Perform(method: .m_createHomeConfigurations__configuration_configuration(`configuration`), performs: perform)
        }
        public static func switchState(id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_switchState__id_id(`id`), performs: perform)
        }
        public static func getHomeConfigurationsByType(type: Parameter<ConfigurationType>, state: Parameter<State>, perform: @escaping (ConfigurationType, State) -> Void) -> Perform {
            return Perform(method: .m_getHomeConfigurationsByType__type_typestate_state(`type`, `state`), performs: perform)
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

// MARK: - IReservationService

open class IReservationServiceMock: IReservationService, Mock {
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





    open func createReservation(reservation: Reservation) throws -> Reservation {
        addInvocation(.m_createReservation__reservation_reservation(Parameter<Reservation>.value(`reservation`)))
		let perform = methodPerformValue(.m_createReservation__reservation_reservation(Parameter<Reservation>.value(`reservation`))) as? (Reservation) -> Void
		perform?(`reservation`)
		var __value: Reservation
		do {
		    __value = try methodReturnValue(.m_createReservation__reservation_reservation(Parameter<Reservation>.value(`reservation`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for createReservation(reservation: Reservation). Use given")
			Failure("Stub return value not specified for createReservation(reservation: Reservation). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getReservations(user: User) throws -> [Reservation] {
        addInvocation(.m_getReservations__user_user(Parameter<User>.value(`user`)))
		let perform = methodPerformValue(.m_getReservations__user_user(Parameter<User>.value(`user`))) as? (User) -> Void
		perform?(`user`)
		var __value: [Reservation]
		do {
		    __value = try methodReturnValue(.m_getReservations__user_user(Parameter<User>.value(`user`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getReservations(user: User). Use given")
			Failure("Stub return value not specified for getReservations(user: User). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getReservations(couchId: String?) throws -> [Reservation] {
        addInvocation(.m_getReservations__couchId_couchId(Parameter<String?>.value(`couchId`)))
		let perform = methodPerformValue(.m_getReservations__couchId_couchId(Parameter<String?>.value(`couchId`))) as? (String?) -> Void
		perform?(`couchId`)
		var __value: [Reservation]
		do {
		    __value = try methodReturnValue(.m_getReservations__couchId_couchId(Parameter<String?>.value(`couchId`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getReservations(couchId: String?). Use given")
			Failure("Stub return value not specified for getReservations(couchId: String?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_createReservation__reservation_reservation(Parameter<Reservation>)
        case m_getReservations__user_user(Parameter<User>)
        case m_getReservations__couchId_couchId(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_createReservation__reservation_reservation(let lhsReservation), .m_createReservation__reservation_reservation(let rhsReservation)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsReservation, rhs: rhsReservation, with: matcher), lhsReservation, rhsReservation, "reservation"))
				return Matcher.ComparisonResult(results)

            case (.m_getReservations__user_user(let lhsUser), .m_getReservations__user_user(let rhsUser)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher), lhsUser, rhsUser, "user"))
				return Matcher.ComparisonResult(results)

            case (.m_getReservations__couchId_couchId(let lhsCouchid), .m_getReservations__couchId_couchId(let rhsCouchid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCouchid, rhs: rhsCouchid, with: matcher), lhsCouchid, rhsCouchid, "couchId"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_createReservation__reservation_reservation(p0): return p0.intValue
            case let .m_getReservations__user_user(p0): return p0.intValue
            case let .m_getReservations__couchId_couchId(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_createReservation__reservation_reservation: return ".createReservation(reservation:)"
            case .m_getReservations__user_user: return ".getReservations(user:)"
            case .m_getReservations__couchId_couchId: return ".getReservations(couchId:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func createReservation(reservation: Parameter<Reservation>, willReturn: Reservation...) -> MethodStub {
            return Given(method: .m_createReservation__reservation_reservation(`reservation`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getReservations(user: Parameter<User>, willReturn: [Reservation]...) -> MethodStub {
            return Given(method: .m_getReservations__user_user(`user`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getReservations(couchId: Parameter<String?>, willReturn: [Reservation]...) -> MethodStub {
            return Given(method: .m_getReservations__couchId_couchId(`couchId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func createReservation(reservation: Parameter<Reservation>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_createReservation__reservation_reservation(`reservation`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func createReservation(reservation: Parameter<Reservation>, willProduce: (StubberThrows<Reservation>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_createReservation__reservation_reservation(`reservation`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Reservation).self)
			willProduce(stubber)
			return given
        }
        public static func getReservations(user: Parameter<User>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getReservations__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getReservations(user: Parameter<User>, willProduce: (StubberThrows<[Reservation]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getReservations__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Reservation]).self)
			willProduce(stubber)
			return given
        }
        public static func getReservations(couchId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getReservations__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getReservations(couchId: Parameter<String?>, willProduce: (StubberThrows<[Reservation]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getReservations__couchId_couchId(`couchId`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([Reservation]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func createReservation(reservation: Parameter<Reservation>) -> Verify { return Verify(method: .m_createReservation__reservation_reservation(`reservation`))}
        public static func getReservations(user: Parameter<User>) -> Verify { return Verify(method: .m_getReservations__user_user(`user`))}
        public static func getReservations(couchId: Parameter<String?>) -> Verify { return Verify(method: .m_getReservations__couchId_couchId(`couchId`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func createReservation(reservation: Parameter<Reservation>, perform: @escaping (Reservation) -> Void) -> Perform {
            return Perform(method: .m_createReservation__reservation_reservation(`reservation`), performs: perform)
        }
        public static func getReservations(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_getReservations__user_user(`user`), performs: perform)
        }
        public static func getReservations(couchId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getReservations__couchId_couchId(`couchId`), performs: perform)
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

    open func getUser(externalId: String?) throws -> User? {
        addInvocation(.m_getUser__externalId_externalId(Parameter<String?>.value(`externalId`)))
		let perform = methodPerformValue(.m_getUser__externalId_externalId(Parameter<String?>.value(`externalId`))) as? (String?) -> Void
		perform?(`externalId`)
		var __value: User? = nil
		do {
		    __value = try methodReturnValue(.m_getUser__externalId_externalId(Parameter<String?>.value(`externalId`))).casted()
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
        case m_getUser__externalId_externalId(Parameter<String?>)
        case m_createUser__user_user(Parameter<User>)
        case m_deleteUser__id_id(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getAllUsers, .m_getAllUsers): return .match

            case (.m_getUser__id_id(let lhsId), .m_getUser__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_getUser__externalId_externalId(let lhsExternalid), .m_getUser__externalId_externalId(let rhsExternalid)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsExternalid, rhs: rhsExternalid, with: matcher), lhsExternalid, rhsExternalid, "externalId"))
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
            case let .m_getUser__externalId_externalId(p0): return p0.intValue
            case let .m_createUser__user_user(p0): return p0.intValue
            case let .m_deleteUser__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getAllUsers: return ".getAllUsers()"
            case .m_getUser__id_id: return ".getUser(id:)"
            case .m_getUser__externalId_externalId: return ".getUser(externalId:)"
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
        public static func getUser(externalId: Parameter<String?>, willReturn: User?...) -> MethodStub {
            return Given(method: .m_getUser__externalId_externalId(`externalId`), products: willReturn.map({ StubProduct.return($0 as Any) }))
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
        public static func getUser(externalId: Parameter<String?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getUser__externalId_externalId(`externalId`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getUser(externalId: Parameter<String?>, willProduce: (StubberThrows<User?>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getUser__externalId_externalId(`externalId`), products: willThrow.map({ StubProduct.throw($0) })) }()
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
        public static func getUser(externalId: Parameter<String?>) -> Verify { return Verify(method: .m_getUser__externalId_externalId(`externalId`))}
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
        public static func getUser(externalId: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getUser__externalId_externalId(`externalId`), performs: perform)
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

// MARK: - IWeatherService

open class IWeatherServiceMock: IWeatherService, Mock {
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





    open func getWeather(cityName: String) throws -> Int {
        addInvocation(.m_getWeather__cityName_cityName(Parameter<String>.value(`cityName`)))
		let perform = methodPerformValue(.m_getWeather__cityName_cityName(Parameter<String>.value(`cityName`))) as? (String) -> Void
		perform?(`cityName`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_getWeather__cityName_cityName(Parameter<String>.value(`cityName`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getWeather(cityName: String). Use given")
			Failure("Stub return value not specified for getWeather(cityName: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getWeather__cityName_cityName(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getWeather__cityName_cityName(let lhsCityname), .m_getWeather__cityName_cityName(let rhsCityname)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCityname, rhs: rhsCityname, with: matcher), lhsCityname, rhsCityname, "cityName"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getWeather__cityName_cityName(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getWeather__cityName_cityName: return ".getWeather(cityName:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getWeather(cityName: Parameter<String>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_getWeather__cityName_cityName(`cityName`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getWeather(cityName: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getWeather__cityName_cityName(`cityName`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getWeather(cityName: Parameter<String>, willProduce: (StubberThrows<Int>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getWeather__cityName_cityName(`cityName`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getWeather(cityName: Parameter<String>) -> Verify { return Verify(method: .m_getWeather__cityName_cityName(`cityName`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getWeather(cityName: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getWeather__cityName_cityName(`cityName`), performs: perform)
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

