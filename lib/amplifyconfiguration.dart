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
                            "PoolId": "us-east-1:07874173-a8ba-4d80-966c-dcf86ae193ee",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_Fs10irzA7",
                        "AppClientId": "50ra29bmd364aonuggakvhqoo9",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://ssstezikynfornigyqvyzmutci.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-hcc52j3ngrcsnpew22aif2dh2q",
                        "ClientDatabasePrefix": "eCommerceCustomerApp_API_KEY"
                    },
                    "eCommerceCustomerApp_AWS_IAM": {
                        "ApiUrl": "https://ssstezikynfornigyqvyzmutci.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "eCommerceCustomerApp_AWS_IAM"
                    },
                    "eCommerceCustomerApp_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://ssstezikynfornigyqvyzmutci.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "eCommerceCustomerApp_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "eCommerceCustomerApp": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://ssstezikynfornigyqvyzmutci.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-hcc52j3ngrcsnpew22aif2dh2q"
                }
            }
        }
    }
}''';