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

public final class AutoRestReportService {
    public let client: AutoRestReportClient

    public let commonOptions: ClientOptions

    /// Options provided to configure this `AutoRestReportClient`.
    public let options: AutoRestReportClientOptions

    init(client: AutoRestReportClient) {
        self.client = client
        self.options = client.options
        self.commonOptions = client.commonOptions
    }

    public func url(forTemplate templateIn: String, withKwargs kwargs: [String: String]? = nil) -> URL? {
        return client.url(forTemplate: templateIn, withKwargs: kwargs)
    }

    public func request(
        _ request: HTTPRequest,
        context: PipelineContext?,
        completionHandler: @escaping HTTPResultHandler<Data?>
    ) {
        return client.request(request, context: context, completionHandler: completionHandler)
    }

    /// Get test coverage report
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getReport(
        withOptions options: GetReportOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<[String: Int32]>
    ) {
        // Construct URL
        guard let urlTemplate = "/report".removingPercentEncoding else {
            self.options.logger.error("Failed to construct url")
            return
        }
        let pathParams = [
            "": ""
        ]
        guard let url = self.url(forTemplate: urlTemplate, withKwargs: pathParams) else {
            self.options.logger.error("Failed to construct url")
            return
        }
        // Construct query
        var queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Process endpoint options
        // Query options
        if let qualifier = options?.qualifier {
            queryParams.append("qualifier", qualifier)
        }
        // Header options
        // Construct request
        guard let requestUrl = url.appendingQueryParameters(queryParams) else {
            self.options.logger.error("Failed to append query parameters to url")
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
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode([String: Int32].self, from: data)
                        dispatchQueue.async {
                            completionHandler(.success(decoded), httpResponse)
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

    /// Get optional test coverage report
    /// - Parameters:

    ///    - options: A list of options for the operation
    ///    - completionHandler: A completion handler that receives a status code on
    ///     success.
    public func getOptionalReport(
        withOptions options: GetOptionalReportOptions? = nil,
        completionHandler: @escaping HTTPResultHandler<[String: Int32]>
    ) {
        // Construct URL
        guard let urlTemplate = "/report/optional".removingPercentEncoding else {
            self.options.logger.error("Failed to construct url")
            return
        }
        let pathParams = [
            "": ""
        ]
        guard let url = self.url(forTemplate: urlTemplate, withKwargs: pathParams) else {
            self.options.logger.error("Failed to construct url")
            return
        }
        // Construct query
        var queryParams: [QueryParameter] = [
        ]

        // Construct headers
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        // Process endpoint options
        // Query options
        if let qualifier = options?.qualifier {
            queryParams.append("qualifier", qualifier)
        }
        // Header options
        // Construct request
        guard let requestUrl = url.appendingQueryParameters(queryParams) else {
            self.options.logger.error("Failed to append query parameters to url")
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
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode([String: Int32].self, from: data)
                        dispatchQueue.async {
                            completionHandler(.success(decoded), httpResponse)
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
