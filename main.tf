terraform {  
    required_providers {  
        harness = {  
            source = "harness/harness"  
            version = "0.35.6"  
        }  
    }  
}

provider "harness" {  
    endpoint   = "https://app.harness.io/gateway"  
    account_id = "2452IT9_R3-nbB2gMz64jw"  
    platform_api_key    = "pat.2452IT9_R3-nbB2gMz64jw.682dad531ef99c3416e35a45.wMyDiIaCKXH3sWGVXasS"  
}