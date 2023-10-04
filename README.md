# iolapopenapiswift
iOLAP OpenAPI Client Code Generation


To invoke the plugin (and generate code):

```bash
$ swift package --allow-writing-to-package-directory generate-api
```

Rename this function in : get/Response

    public func map<U>(_ closure: (T) throws -> U) rethrows -> Response<U> {
        Response<U>(value: try closure(value), data: data, response: response, task: task, metrics: metrics)
    }
