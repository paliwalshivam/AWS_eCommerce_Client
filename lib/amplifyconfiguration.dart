const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:de38059c-8a34-45c0-b046-a5ba416256ec",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_V4bm6dl2F",
                        "AppClientId": "552h5qaps2k8ih06ecqtq2g2f9",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "DynamoDBObjectMapper": {
                    "Default": {
                        "Region": "us-east-1"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "ecommercecustomer": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://6gp7okoovndkvk5hegc4u5v6tq.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-iqtg7f2safewlkhmjxbufeullq"
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsDynamoDbStoragePlugin": {
                "name": "ProductModel-aid5kt6ahngb3bvewg4jdt2uua-dev",
                "region": "us-east-1",
                "arn": "arn:aws:dynamodb:us-east-1:989775503323:table/ProductModel-aid5kt6ahngb3bvewg4jdt2uua-dev",
                "streamArn": "arn:aws:dynamodb:us-east-1:989775503323:table/ProductModel-aid5kt6ahngb3bvewg4jdt2uua-dev/stream/2021-07-07T10:19:30.169",
                "partitionKeyName": "id",
                "partitionKeyType": "S"
            }
        }
    }
}''';