// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable cyclomatic_complexity
// swiftlint:disable function_body_length
// swiftlint:disable type_body_length

public final class DateOperation {
    public let client: AutoRestDateTestClient

    public let commonOptions: ClientOptions

    /// Options provided to configure this `AutoRestDateTestClient`.
    public let options: AutoRestDateTestClientOptions

    init(client: AutoRestDateTestClient) {
        self.client = client
        self.options = client.options
        self.commonOptions = client.commonOptions
    }

    public func url(
        host hostIn: String? = nil,
        template templateIn: String,
        pathParams pathParamsIn: [String: String]? = nil,
        queryParams queryParamsIn: [QueryParameter]? = nil
    ) -> URL? {
        return client.url(host: hostIn, template: templateIn, pathParams: pathParamsIn, queryParams: queryParamsIn)
    }

    public func request(
        _ request: HTTPRequest,
        context: PipelineContext?,
        completionHandler: @escaping HTTPResultHandler<Data?>
    ) {
        return client.request(request, context: context, completionHandler: completionHandler)
    }

    /// Get null date value
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getNull(
        withOptions options: GetNullOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date?>
    ) {
        // Construct URL
        let urlTemplate = "/date/null"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    if data.count == 0 {
                        dispatchQueue.async {
                            completionHandler(.success(nil), httpResponse)
                        }
                        return
                    }

                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Get invalid date value
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getInvalidDate(
        withOptions options: GetInvalidDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date>
    ) {
        // Construct URL
        let urlTemplate = "/date/invaliddate"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Get overflow date value
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getOverflowDate(
        withOptions options: GetOverflowDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date>
    ) {
        // Construct URL
        let urlTemplate = "/date/overflowdate"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Get underflow date value
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getUnderflowDate(
        withOptions options: GetUnderflowDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date>
    ) {
        // Construct URL
        let urlTemplate = "/date/underflowdate"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Put max date value 9999-12-31
    /// - Parameters:
    ///    - maxDate : date body
    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func put(
        maxDate: Date,
        withOptions options: PutMaxDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Void>
    ) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let maxDateString = dateFormatter.string(from: maxDate)
        // Construct URL
        let urlTemplate = "/date/max"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestBody = try? JSONEncoder().encode(maxDateString) else {
            self.options.logger.error("Failed to encode request body as json.")
            return
        }
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .put, url: requestUrl, headers: headers, data: requestBody) else {
            self.options.logger.error("Failed to construct HTTP request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    dispatchQueue.async {
                        completionHandler(
                            .success(()),
                            httpResponse
                        )
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Get max date value 9999-12-31
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getMaxDate(
        withOptions options: GetMaxDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date>
    ) {
        // Construct URL
        let urlTemplate = "/date/max"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Put min date value 0000-01-01
    /// - Parameters:
    ///    - minDate : date body
    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func put(
        minDate: Date,
        withOptions options: PutMinDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Void>
    ) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let minDateString = dateFormatter.string(from: minDate)
        // Construct URL
        let urlTemplate = "/date/min"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestBody = try? JSONEncoder().encode(minDateString) else {
            self.options.logger.error("Failed to encode request body as json.")
            return
        }
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .put, url: requestUrl, headers: headers, data: requestBody) else {
            self.options.logger.error("Failed to construct HTTP request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    dispatchQueue.async {
                        completionHandler(
                            .success(()),
                            httpResponse
                        )
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }

    /// Get min date value 0000-01-01
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getMinDate(
        withOptions options: GetMinDateOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<Date>
    ) {
        // Construct URL
        let urlTemplate = "/date/min"
        let pathParams = [
            "$host": client.endpoint.absoluteString
        ]
        // Construct query
        let queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Construct request
        guard let requestUrl = url(
            host: "{$host}",
            template: urlTemplate,
            pathParams: pathParams,
            queryParams: queryParams
        ) else {
            self.options.logger.error("Failed to construct request url")
            return
        }

        guard let request = try? HTTPRequest(method: .get, url: requestUrl, headers: headers) else {
            self.options.logger.error("Failed to construct Http request")
            return
        }

        // Send request
        let context = PipelineContext.of(keyValues: [
            ContextKey.allowedStatusCodes.rawValue: [200] as AnyObject
        ])
        context.add(cancellationToken: options?.cancellationToken, applying: self.options)
        context.merge(with: options?.context)
        self.request(request, context: context) { result, httpResponse in
            let dispatchQueue = options?.dispatchQueue ?? self.commonOptions.dispatchQueue ?? DispatchQueue.main
            guard let data = httpResponse?.data else {
                let noDataError = AzureError.client("Response data expected but not found.")
                dispatchQueue.async {
                    completionHandler(.failure(noDataError), httpResponse)
                }
                return
            }

            switch result {
            case .success:
                guard let statusCode = httpResponse?.statusCode else {
                    let noStatusCodeError = AzureError.client("Expected a status code in response but didn't find one.")
                    dispatchQueue.async {
                        completionHandler(.failure(noStatusCodeError), httpResponse)
                    }
                    return
                }
                if [
                    200
                ].contains(statusCode) {
                    do {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let decodedStr = try JSONDecoder().decode(String.self, from: data)
                        if let decoded = dateFormatter.date(from: decodedStr) {
                            dispatchQueue.async {
                                completionHandler(.success(decoded), httpResponse)
                            }
                        } else {
                            dispatchQueue.async {
                                completionHandler(.failure(AzureError.client("Decoding error.", nil)), httpResponse)
                            }
                        }

                    } catch {
                        dispatchQueue.async {
                            completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                        }
                    }
                }
            case .failure:
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(ErrorType.self, from: data)
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.service("", decoded)), httpResponse)
                    }
                } catch {
                    dispatchQueue.async {
                        completionHandler(.failure(AzureError.client("Decoding error.", error)), httpResponse)
                    }
                }
            }
        }
    }
}
