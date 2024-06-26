# 개요

FAVORLET은 NFT의 활용성을 극대화시키는 NFT 전용 지갑입니다. NFT에 특화된 다양한 기능을 제공하고 블록체인 위의 NFT를 오프라인 세상과 연결하여 새로운 NFT 경험을 만들어나가고 있습니다. 
만약 서비스 중이거나 개발 중인 네이티브 앱 (이하 네이티브 앱)에서 블록체인과 상호작용을 하고자 한다면, FAVORLET의 app2app SDK을 통해 쉽게 구현하실 수 있습니다.

## 기능

- 지갑연결 (connectWallet)
- 지갑연결 및 메시지 서명 (connectWalletAndSignMessage) (1.1.0 이상)
- 메시지 서명 (signMessage)
- 코인 전송 (sendCoin)
- 컨트랙트함수 실행 (executeContractWithEncoded) (1.0.2 이상)

FAVORLET의 app2app은 4가지의 기능을 제공합니다. 
<b>지갑연결</b>은 사용자의 지갑 주소를 네이티브 앱에 가져오기 위한 기능으로, 지갑 주소가 있으면 블록체인 상의 존재하는 지갑 관련 데이터를 조회할 수 있습니다.
<b>지갑연결 및 메시지 서명</b> 은 지갑연결과 메시지 서명을 동시에 수행하는 기능으로, 연결 후 서명을 받는 번거로운 작업을 한번에 수행할 수 있습니다.
<b>메시지 서명</b>은 네이티브 앱에서 지정한 메시지를 서명하여, 지갑의 소유권 확인이나, 인증/승인의 역할을 할 수 있는 기능입니다.
<b>코인 전송</b>은 체인의 플랫폼 코인을 전송하는 기능입니다. 받을 지갑 주소와 수량을 지정하여 전송하실 수 있습니다. 
<b>컨트랙트함수 실행</b>은 지정된 컨트랙트 함수를 실행하는 기능으로, 함수에 따라 다양한 기능을 수행할 수 있습니다.

## 동작흐름

- 요청단계 (Request)
- 실행단계 (Execute)
- 결과단계 (Receipt)

FAVORLET의 app2app은 <b>요청-실행-결과</b>의 3단계로 동작합니다.
<b>요청단계</b>는 네이티브 앱에서 수행하고자 하는 액션을 정의하는 단계입니다. 위에서 설명된 4가지의 기능 중 하나를 액션으로 지정할 수 있습니다. 
<b>실행단계</b>는 요청 단계에서 지정한 액션을 FAVORLET이 실행하는 단계입니다. FAVORLET에 요청ID를 전달하면, FAVORLET이 해당 액션을 실행합니다. 
<b>결과단계</b>는 FAVORLET에서 실행한 액션의 결과를 가져오는 단계입니다.
즉, 다음과 같이 간단하게 정리할 수 있겠습니다.

1. 네이티브 앱에서 request 함수를 이용해 액션을 지정하면 요청ID를 받음.
2. execute 함수를 이용해 요청ID를 FAVORLET으로 전달하면, FAVORLET으로 이동하여 해당 액션을 수행함.
3. 액션 수행 완료 후, 네이티브 앱으로 복귀하면 receipt 함수를 이용해 결과 데이터를 가져옴.


# 샘플앱 둘러보기

샘플앱을 실행하시려면, <b>favorlet-app2app-sdk-ios</b> 저장소를 Clone 하신 후에, /Example 폴더로 이동하여 아래 명령어를 입력해주세요.
> pod install

XCode에서 /Example/FavorletApp2App.xcworkspace 파일을 열어주세요.
UI는 SwiftUI 를 이용해 <b>ContentView</b>에 구성되어 있고, app2app 연동 관련 기능은 <b>ContentViewModel</b>에 구현되어 있습니다.

# 시작하기

## 요구사항

- iOS 15 이상.

## SDK 설정하기

### 의존성 설정

iOS app2app SDK는 Cocoapods 를 통한 배포만 지원하고 있으므로, 네이티브 앱의 Podfile 파일에 아래와 같이 의존성 설정을 추가한 후 명령어를 실행해야 합니다.

#### Podfile
```
pod 'FavorletApp2App', '~> 1.1.0'
```

```bash
$ pod install
```

## SDK 사용하기

### 공통 사항

#### 지원하는 체인 ID

|네트워크명|Chain ID|
|------|---:|
|클레이튼 메인넷|8217|
|클레이튼 테스트넷 (Baobab)|1001|
|이더리움 메인넷|1|
|이더리움 테스트넷 (Goerli)|5|
|폴리곤 메인넷|137|
|폴리곤 테스트넷 (Mumbai)|80001|
|바이낸스 스마트체인 메인넷|56|
|바이낸스 스마트체인 테스트넷|97|


#### App2AppAction
- CONNECT_WALLET : 지갑연결.
- CONNECT_WALLET_AND_SIGN_MESSAGE : 지갑연결 및 메시지 서명.
- SIGN_MESSAGE : 메시지 서명.
- SEND_COIN : 코인 전송.
- EXECUTE_CONTRACT_WITH_ENCODED : 컨트랙트함수 실행 (1.0.2 이상)

#### App2AppStatus
- REQUESTED : app2app으로 수행할 액션 데이터를 요청한 상태.
- EXECUTED : 요청한 액션을 FAVORLET이 수행한 상태.
- REVERTED : 요청한 액션을 FAVORLET이 수행하지 못하는 상태.
- CANCELED : 요청한 액션을 FAVORLET이 취소한 상태.
- SUCCEED : 요청한 액션을 FAVORLET이 수행하고, 블록체인에서도 성공한 상태.
- FAILED : 요청한 액션을 FAVORLET이 수행했으나, 블록체인에서 실패한 상태.

### App2AppComponent 생성

```swift
let app2AppComponent = App2AppComponent()
```
app2app SDK의 모든 기능은 App2AppComponent를 통해서만 사용해야 합니다.
App2AppComponent의 실행 함수를 제외한 요청 및 결과 함수는 Swift Concurrency 를 이용한 비동기 함수로 구현되어 있습니다.
따라서 네이티브 앱에서 해당 함수를 호출할 때에는 await 키워드를 사용하여 호출해야 합니다.

예시
```swift
...
do {
    try await self.app2AppComponent.receipt(...)
} catch {
    ...
}
...
```

### 요청함수 호출

app2app의 각 기능 별로 필요한 매개변수는 아래 예시와 같이 데이터 객체를 통해 전달해야 하며, 정상적으로 호출 시 요청 ID를 반환받을 수 있습니다.

#### 지갑연결
```swift
let request = App2AppConnectWalletRequest(
    action: App2AppAction.CONNECT_WALLET.rawValue,    // 액션.
    chainId: 8217,                                 // 체인ID. (Optional - 지정하지 않을 경우 nil)
    blockChainApp: App2AppBlockChainApp(           // 네이티브 앱 정보.
        name: "App2App Sample",                    // 네이티브 앱 이름. (FAVORLET app2app 연동화면에 표시될 앱 이름)
        successAppLink: nil,                       // 현재는 미지원.
        failAppLink: nil                           // 현재는 미지원.
    )
)
let response = try await self.app2AppComponent.requestConnectWallet(request)
let requestId = response.requestId ?? ""
```

#### 지갑연결 및 메시지 서명
```swift
let request = App2AppConnectWalletAndSignMessageRequest(
    action: App2AppAction.CONNECT_WALLET_AND_SIGN_MESSAGE.rawValue,
    chainId: chainId,
    blockChainApp: App2AppBlockChainApp(
        name: "App2App Sample",
        successAppLink: nil,
        failAppLink: nil
    ),
    connectWalletAndSignMessage: App2AppConnectWalletAndSignMessage(
        value: "favorlet"                          // 메시지 원문.
    )
)
let response = try await self.app2appComponent.requestConnectWalletAndSignMessage(request)
let requestId = response.requestId ?? ""
```

#### 메시지 서명
```swift
let request = App2AppSignMessageRequest(
    action: App2AppAction.SIGN_MESSAGE.rawValue,
    chainId: 8217,
    blockChainApp: App2AppBlockChainApp(
        name: "App2App Sample",
        successAppLink: nil,
        failAppLink: nil
    ),
    signMessage: App2AppSignMessage(  // 메시지 서명에 필요한 데이터.
        from: "0x123...456",          // 서명할 지갑 주소.
        value: "favorlet"             // 메시지 원문.
    )
)
let response = try await self.app2AppComponent.requestSignMessage(request)
let requestId = response.requestId ?? ""
```

#### 코인 전송
```swift
let request = App2AppSendCoinRequest(
    action: App2AppAction.SEND_COIN.rawValue,
    chainId: 8217,
    blockChainApp: App2AppBlockChainApp(
        name: "App2App Sample",
        successAppLink: nil,
        failAppLink: nil
    ),
    transactions: [                        // 실행할 트랜잭션 리스트. (단, 현재는 1개의 트랜잭션만 처리.)
        App2AppTransaction(
            from: "0x123...456",           // 트랜잭션을 전송할 지갑 주소.
            to: "0x123...123",             // 컨트랙트 주소.
            value: "1000000000000000000"   // 보낼 코인 수량. (단위: peb)
        )
    ]
)
let response = try await self.app2AppComponent.requestSendCoin(request)
let requestId = response.requestId ?? ""
```

#### 컨트랙트함수 실행 (1.0.2 이상)

##### 기존 functionName, ABI, parameters 데이터를 전달하는 방식에서, 인코딩된 함수 데이터를 전달하는 방식으로 변경.
##### - 인코딩된 함수데이터 예시 0x095ea7b30000000000000000000000001f6d738ec0cf07a451af55b73bc610edb20c546c0000000000000000000000000000000000000000000000000000000000000000
##### - 참고링크 [[web3swift.sources.Web3+Contract.swift]](https://github.com/web3swift-team/web3swift/blob/develop/Sources/web3swift/Web3/Web3%2BContract.swift)    

##### - web3swift 기준 : Web3+Contract.swift 의 createReadOperation() 함수 내에 인코딩하는 부분 참고
 ```contract.method(method, parameters: parameters, extraData: extraData) else { return nil }```
     
```swift
  let request = App2AppExecuteContractRequest(
    action: App2AppAction.EXECUTE_CONTRACT.value,
    chainId: 8217,
    blockChainApp: App2AppBlockChainApp(
        name: "App2App Sample",
        successAppLink: nil,               
        failAppLink: nil
    ),
    transactions: [                        // 실행할 트랜잭션 리스트. (단, 현재는 1개의 트랜잭션만 처리.)
        App2AppTransaction(
            from: "0x123...456",           // 트랜잭션을 전송할 지갑 주소.
            to: "0x654...321",             // 컨트랙트 주소.
            value: "0",                    // 보낼 코인 수량. (단위: peb) 단, non-payable 함수인 경우에는 0으로 지정해야 함.
            data = "0xa9059cbb...0000",    // 인코딩된 함수데이터.
            gasLimit = "10000"             // 가스 리밋값. (Optional - 이 값을 지정해서 보낼 경우, FAVORLET 에서는 이 값으로 설정)
        )
    )
)
let response = try await self.app2AppComponent.requestExecuteContract(request)
let requestId = response.requestId ?? ""
 ```


### 실행함수 호출

요청 함수를 호출해서 반환받은 요청 ID는 실행함수를 통해 FAVORLET으로 전달해야 합니다. 
네이티브 앱에서 실행 함수를 호출하면 FAVORLET이 실행되면서 FAVORLET의 app2app 화면으로 이동합니다.

```swift
self.app2AppComponent.execute(requestId: requestId)
```

### 결과함수 호출

FAVORLET에서 정상적으로 액션을 실행하면, 다시 네이티브 앱으로 복귀합니다.
이때 결과 함수를 통해 액션에 대한 실행 결과를 가져올 수 있습니다.

```swift
let response = try await app2AppComponent.receipt(requestId: app2appRequestId)
```

결과 데이터는 아래 예시와 같이 구성되어 반환됩니다.

#### 지갑연결 (connectWallet)
- requestId (String) : 요청ID.
- expiredAt (Int) : 요청 만료시간.
- action (String) : 액션.
- connectWallet (App2AppReceiptResponse.ConnectWallet) : 연결된 지갑 정보.
  - status (String) : 상태.
  - address (String) : 연결된 지갑 주소.

예시
```json
{
  "requestId": "96a1f659-3cc4-42db-aa87-7ade549df66d",
  "expiredAt": 1664340943,
  "action": "connectWallet",
  "connectWallet": {
    "status": "succeed",
    "address": "0x123...123"
  }
}
```

#### 지갑연결 및 메시지 서명 (connectWalletAndSignMessage)

- requestId (String) : 요청ID.
- expiredAt (Int) : 요청 만료시간.
- action (String) : 액션.
- connectWalletAndSignMessage (App2AppReceiptResponse.ConnectWalletAndSignMessage) : 메시지 서명 정보.
  - statue (String) : 상태.
  - signature (String) : 메시지 해시값.
  - address (String) : 서명한 지갑주소.  

예시
```json
{
    "requestId": "171bb348-a2ce-4286-a48d-38139a459a6e",
    "expiredAt": 1714465007,
    "action": "connectWalletAndSignMessage",
    "connectWalletAndSignMessage": {
        "status": "succeed",
        "signature": "0x6b588fc7c4fe83abe3ad72d06fe75a9b9d6141e71232399e997515df5fa17a410d20ae1fec34f873edb51586c86111c52906949ed73c232b17a3aacfd206b32c1b",
        "address": "0x06d101706d722f67eac76eb14fd0aa3f46c8b02e"
    }
}
```

#### 메시지 서명 (signMessage)
- requestId (String) : 요청ID.
- expiredAt (Int) : 요청 만료시간.
- action (String) : 액션.
- signMessage (App2AppReceiptResponse.SignMessage) : 메시지 서명 정보.
  - status (String) : 상태.
  - signature (String) : 메시지 해시값.

예시
```json
{
  "requestId": "879855c2-fd2e-4ac9-bc11-2939b7ca9697",
  "expiredAt": 1664341330,
  "action": "signMessage",
  "signMessage": {
    "status": "succeed",
    "signature": "0xasdkasldjwqevnwrejkqwkeqlwkejq"
  }
}
```

#### 코인 전송 (sendCoin)
- requestId (String) : 요청ID.
- expiredAt (Int) : 요청 만료시간.
- action (String) : 액션.
- transactions (List<App2AppReceiptResponse.Transaction>) : 코인전송 트랜잭션 정보.
- - status (String) : 상태.
- - txHash (String) : 트랜잭션 해시.

예시
```json
  {
    "requestId": "19a58b08-4c0d-4552-8174-c9a767668f43",
    "expiredAt": 1664341165,
    "action" : "sendCoin",
    "transactions": [
        {
            "status": "succeed",
            "txHash": "0x123...123"
        }
    ]
}
```
     
#### 컨트랙트함수 실행 (executeContractWithEncoded) (1.0.2 이상)
- requestId (String) : 요청ID.
- expiredAt (Int) : 요청 만료시간.
- action (String) : 액션.
- transactions (List<App2AppReceiptResponse.Transaction>) : 컨트랙트 함수 실행 관련 트랜잭션 정보.
- - status (String) : 상태.
- - txHash (String) : 트랜잭션 해시.

예시
```json
  {
    "requestId": "278183ab-d3cb-4563-b0d4-ece1a2559f03",
    "expiredAt": 1664341448,
    "action": "executeContractWithEncoded",
    "transactions": [
        {
            "status": "succeed",
            "txHash": "0x123...123"
        }
    ]
}
```
     
# 제약사항
23.04.13 기준

#### app2app 트랜잭션
- 설계는 복수 트랜잭션 처리가 고려되어 있으나, 현재는 1개의 트랜잭션만 처리.
- 만약 복수 개의 트랜잭션을 요청 시, FAVORLET에서는 첫번째 트랜잭션만 처리.    


# 변경사항

### 1.1.0 (24.04.30)
지갑연결 및 메시지 서명 (connectWalletAndSignMessage) 액션 추가

### 1.0.2 (23.04.13)
기존 컨트랙트함수 실행 (executeContract) 삭제    
신규 컨트랙트함수 실행 (executeContractWithEncoded) 추가
      

### 1.0.1 (23.01.20)

#### 멀티 체인 지원
- 기존의 클레이튼 메인넷 (8217) 외에 아래에 정의된 체인을 지원합니다.
- 클레이튼 메인넷 (8217)
- 클레이튼 테스트넷 Baobab (1001)
- 이더리움 메인넷 (1)
- 이더리움 테스트넷 Goerli (5)
- 폴리곤 메인넷 (137)
- 폴리곤 테스트넷 Mumbai (80001)
- 바이낸스 스마트체인 메인넷 (56)
- 바이낸스 스마트체인 테스트넷 (97)

#### ChainId 옵셔널 처리
- ConnectWallet 시에 ChainId 값이 필수가 아니고 옵셔널하게 변경되었습니다.
- 따라서 ChainId를 지정하지 않고 ConnectWallet을 할 경우, Receipt에는 FAVORLET에 선택되어있는 ChainId가 전달됩니다. 

#### ExecuteContract 에 gasLimit 옵션 추가
- gasLimit 을 지정해서 요청할 경우, FAVORLET에서 해당 값으로 설정합니다.
- gasLimit 을 지정하지 않고 요청할 경우, FAVORLET에서 설정합니다.

