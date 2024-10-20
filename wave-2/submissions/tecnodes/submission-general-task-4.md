# 1. Story Explorer

We are releasing v0.1 of story explorer, if we are selected more exciting featues will be developed such as wallet integration.

### Features
- `Overview page`: shows basic chain stats
- `Validator Page` validator's listing page along with their block signing stats
  - `Validator details page`
- `Blocks Page`: Blocks listing page
  - `Blocks detail page`
- `Transaction Page`
  - `Transaction detail page`
- `Chain configuration`
- `Tools`
  -   `RPC checker`, where user can easily search working RPCs (page will keep updating with more RPC URLs)
    -   A EVM jsonrpc will be added
  -   `Block checker` user can find past and future block, in case of future block a block counter by clicking on `Blocks Detail`

### Explorer URL
- https://explorer.story.tecnodes.network/

# 2. Story Public APIs
- https://api.story.tecnodes.network/api/getallvalidators `fetch all validators along with their block signing information`
- https://api.story.tecnodes.network/api/getblock/<block_number> `fetch block detail`
  - **`Example:`** https://api.story.tecnodes.network/api/getblock/1539240
- https://api.story.tecnodes.network/api/viewTransaction/<tx_hash_with_0x> `fetch tx detail`
  - **`Example:`** https://api.story.tecnodes.network/api/viewTransaction/0x210f7c13273d4b4ffc7baeaddbbe23697318844294eaa0208c595d5a83d1e283

