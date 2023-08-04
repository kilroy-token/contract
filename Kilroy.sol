// SPDX-License-Identifier: Unlicensed

/*

                                                                                     %@@@@@@@@@@@(                                                                                                      
                                                                           @@@@@@@@@@@,        (@@@@@@@@@@                                                                                              
                                                                      @@@@@@#                            @@@@@@.                                                                                        
                                                                  @@@@@@                                      @@@@@                                                                                     
                                                               @@@@@                                              @@@@                                                                                  
                                                             @@@@                                                    @@@.                                                                               
                                                           @@@@                                                        @@@*                                                                             
                                                          @@@                                                            @@@                                                                            
                                                        @@@@                                                               @@@                                                                          
                                                       @@@@                      @@*               @@@                      @@@                                                                         
                                                      &@@@                      @@@@               @@@                       &@@&                                                                       
                                                     &@@@                                                                      @@@                                                                      
                                                    (@@@                                                                        @@@                                                                     
                                                    @@@                           .(               @@                            @@@                                                                    
                                                   @@@@                           @@@              @@@                            @@@               @@@@@@@@@@@@@@@@@@@@@@@@@@                          
                &@@@@@@@@@@@@@@@@@@@*              @@@                            @@&               @@@                            @@/           @@@@@                       @@@@                       
           @@@@@@.                 @@@@@*         @@@@                           ,@@&               @@@                            #@@(        @@@@                            @@@@@@@@@@@@@@@@@@@@@@@@@
        @@@@                          ,@@@/**%@@@@@@@@           .**((%&@@@@@@@@@@@@(                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,                      @@,    @@@                     
@@@@@@@@@@@     @                      @@@@@@@&%%##((//,,..                       @@                 @@@.                                       @@.    @@@@     @@@@    @@@@@   &@@/                    
        @@@   #@@@,    @@@.     @@@    @@@@                                       @@                  @@@                                       @@@    @@@@     @@@@@   %@@@@   @@@(                    
        @@@   @@@@@    @@@@     @@@@   @@@@                                       @@                  @@@                                        @@&   @@@@@    @@@@@   @@@@@@@@@@@                     
        @@@   @@@@@    @@@@     @@@@   @@@(                                      &@@                   @@@                                        @@@  @@@@@    @@@@@@  @@@  @@@@@                      
         @@@@@@@@@@%   @@@@@    @@@@@ %@@@                                       @@@                   @@@                                         @@@@@@ @@@   @@( @@@@@@@                             
          &@@/   @@@, @@@ @@@  @@@ #@@@@@                                        @@@                    @@@                                                @@@@@@&    #@*                               
                  @@@@@@   @@@@@@&   ,                                           @@&                    @@@                                                                                             
                                                                                 @@%                     @@@                                                                                            
                                                                                 @@%                     @@@                                                                                            
                                                                                 @@@                     (@@@                                                                                           
                                                                                 &@@                      @@@                                                                                           
                                                                                  @@                      @@@                                                                                           
                                                                                  @@@                     @@@                                                                                           
                                                                                   @@@                   *@@@                                                                                           
                                                                                    @@@                  @@@                                                                                            
                                                                                      @@@%             @@@(                                                                                             
                                                                                        @@@@@@@@@@@@@@@@                                                                                                
                                                                                                                                                                                                        
                                                              Kilroy is here, on ETH

    Telegram:  https://t.me/kilroyportal
    Twitter :  https://twitter.com/KilroyOnEth
    Website :  https://kilroyoneth.com/

*/

pragma solidity ^0.8.0;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
 
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "div by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "mod by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

pragma solidity ^0.8.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

pragma solidity ^0.8.0;

contract Kilroy is Context, IERC20, Ownable {
    using SafeMath for uint256;

    mapping (address => uint256) private _specialFees;
    mapping (address => mapping (address => uint256)) private _allowances;

    mapping( address => bool) private _hasSpecialFee;
    mapping( address => uint256 ) private _balances;

    address payable public burnAddress =  payable(0x000000000000000000000000000000000000dEaD);
    address payable public fundAddress = burnAddress;

    uint256 public numTokensToSell = 10000 * (10**18);
    uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal = 100000000 * (10**18); 
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 public _maxTxAmount = 2000000 * (10**18);

    string private constant _name = "Kilroy was here";
    string private constant _symbol = "KILROY";
    uint8 private constant _decimals = 18;
       
    uint256 public _liquidityFee = 2000;
    uint256 private _prevLiquidityFee = _liquidityFee;

    uint256 public _projectFee = 1000;
    uint256 private _prevProjectFee = _projectFee;
    
    IUniswapV2Router02 public uniswapswapV2Router;
    address public uniswapswapV2Pair;
    
    bool private inSwapAndLiquify;
    
    bool public swapAndLiquifyEnabled = false;
    bool public swapAndLiquifyMaxAmountEnabled = true;
        
    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event SwapAndLiquify(uint256 tokensSwapped, uint256 ETHReceived, uint256 tokensIntoLiquidity);
    event SwapAndLiquifyMaxAmountEnabled(bool enabled, uint256 maxTokenIntoLiquidity);
    event SwapAndFundProject(uint256 amount);
    event SetRouterAddress(address newRouter, address pair);
    event SetPairAddress(address newPair);
    event SetFundAddress(address newAddress);
    event SetFees(uint256 newLiquidityFee, uint256 newProjectFee);
    event SetFee(address account, uint256 newFee, bool enabled);
    event SetnumTokensToSell(uint256 amount);
    event RescueETH(uint256 amount);


    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }
    
    constructor () {
        // Base MainNet, swap Router
        IUniswapV2Router02 _uniswapswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        
        // Create a uniswap pair for this new token
        uniswapswapV2Pair = IUniswapV2Factory(_uniswapswapV2Router.factory())
            .createPair(address(this), _uniswapswapV2Router.WETH());

        // set the rest of the contract variables
        uniswapswapV2Router = _uniswapswapV2Router;
       
        //exclude owner and this contract from fee
        _hasSpecialFee[ owner() ] = true;
        _hasSpecialFee[ address(this) ] = true;
     
        fundAddress = payable( owner() );

        _balances[ _msgSender() ] = _tTotal;

        emit Transfer(address(0), _msgSender(), _tTotal);
    }

    function name() external pure returns (string memory) {
        return _name;
    }

    function symbol() external pure returns (string memory) {
        return _symbol;
    }

    function decimals() external pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
       return _balances[ account ];
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "Exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) external virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) external virtual returns (bool) {
        _approve(_msgSender(), spender,
            _allowances[_msgSender()][spender].sub(subtractedValue, "Allowance below zero"));
        return true;
    }

    function isFeeForAddressEnabled(address account) external view returns (bool) {
        return _hasSpecialFee[ account ];
    }

    function getFeeForAddress(address account) external view returns (uint256) {
        return  _specialFees[ account ];
    }

    function setRouterAddress(address routerAddress) external onlyOwner() {
        require(address(uniswapswapV2Router) != routerAddress);
        IUniswapV2Router02 newRouter = IUniswapV2Router02( routerAddress );
        // test if pair exists and create if it does not exist
        address pair = IUniswapV2Factory(newRouter.factory()).getPair(address(this), newRouter.WETH());
        if (pair == address(0)) {
            uniswapswapV2Pair = IUniswapV2Factory(newRouter.factory()).createPair(address(this), newRouter.WETH());
        }
        else {
            uniswapswapV2Pair = pair;
        }

        // approve new router to spend contract tokens
        _approve( address(this), routerAddress, MAX );

        // reset approval of old router
        _approve( address(this), address(uniswapswapV2Router), 0);

        // update state
        uniswapswapV2Router = IUniswapV2Router02(newRouter);

        emit SetRouterAddress(routerAddress, uniswapswapV2Pair);
    }

    function setPairAddress(address newPair) external onlyOwner() {
        uniswapswapV2Pair = newPair;

        emit SetPairAddress(uniswapswapV2Pair);
    }

    function setFundAddress(address newAddress) external onlyOwner() {
        fundAddress = payable(newAddress);

        emit SetFundAddress(fundAddress);
    }

   function setFees(uint256 newLiquidityFee, uint256 newProjectFee) external onlyOwner() {
        require( newLiquidityFee.add(newProjectFee) <= 500, "Total fees must be <= 500" );
        
        _liquidityFee = newLiquidityFee;
        _projectFee = newProjectFee;
        
        emit SetFees(newLiquidityFee, newProjectFee);
    }

    function setFee(address account, uint256 newFee, bool enabled) external onlyOwner {
        require( newFee <= 500, "Total fee must be <= 500" );

        _specialFees[ account ] = newFee;
        _hasSpecialFee[ account ] = enabled;
        emit SetFee(account, newFee, enabled);
    }

    function setMaxTxPercent(uint256 maxTxPercent) external onlyOwner() {
        _maxTxAmount = _tTotal.mul(maxTxPercent).div(
            10**2
        );
    }
 
    function setSwapAndLiquifyEnabled(bool _enabled) external onlyOwner {
        swapAndLiquifyEnabled = _enabled;
        emit SwapAndLiquifyEnabledUpdated(_enabled);
    }
    
    function setSwapAndLiquifyMaxAmountEnabled(bool _enabled) external onlyOwner {
        swapAndLiquifyMaxAmountEnabled = _enabled;
        emit SwapAndLiquifyMaxAmountEnabled(_enabled, numTokensToSell);
    }

    function setSwapAndLiquifyMaxAmount(uint256 amount) external onlyOwner {
        require( amount > 0 );
        numTokensToSell = amount;
        emit SetnumTokensToSell(amount);
    }

    function rescueETH(uint256 amount) external onlyOwner {
        payable( msg.sender ).transfer(amount);
        emit RescueETH(amount);
    }
   
    function saveAllFees() private {
        _prevProjectFee = _projectFee;
        _prevLiquidityFee = _liquidityFee;
    }
  
    function setSpecialFee(address from, address to) private {
        uint256 totalFee = _liquidityFee.add(_projectFee);
        if( totalFee == 0 ) {
            return;
        }

        // either one or both have a special fee, take the lowest
        address lowestFeeAccount = from;
        if( _hasSpecialFee[from] && _hasSpecialFee[to]) {
            lowestFeeAccount = ( _specialFees[from] > _specialFees[to] ? to : from );
        } else if ( _hasSpecialFee[to] ) {
            lowestFeeAccount = to;
        }

        // get the fee
        uint256 fee = _specialFees[ lowestFeeAccount ];
        
        // set fees
        _liquidityFee = fee.mul(_liquidityFee).div( totalFee );
        _projectFee = fee.mul(_projectFee).div( totalFee );

    }

    function restoreAllFees() private {
        _projectFee = _prevProjectFee;
        _liquidityFee = _prevLiquidityFee;
    }
 
    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0) );
        require(spender != address(0) );

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function isSwap(address from, address to) private view returns (bool) {
        return (from == uniswapswapV2Pair || to == uniswapswapV2Pair);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(amount <= balanceOf(from), "Insufficient balance");
        require(amount >= 0, "Invalid amount");
        if(from != owner() && to != owner())
            require(amount <= _maxTxAmount, "Exceeds the maxTxAmount");

        uint256 contractTokenBalance = balanceOf(address(this));
        bool overMinTokenBalance = contractTokenBalance > numTokensToSell;
         
        // save all the fees
        saveAllFees();

        if( isSwap(from,to) ) {
            // if the address has a special fee, use it
            if( _hasSpecialFee[from] || _hasSpecialFee[to] ) {
                setSpecialFee(from,to);
            }
        }
        else {
            // normal transfer
            _liquidityFee = 0;
            _projectFee = 0;
        }

        // is the token balance of this contract address over the min number of
        // tokens that we need to initiate a swap + liquidity token burn?
        // also, don't get caught in a circular liquidity event.
        // also, don't swap & liquify if sender is uniswap pair.
        if (
            overMinTokenBalance &&
            !inSwapAndLiquify &&
            from != uniswapswapV2Pair &&
            swapAndLiquifyEnabled
        ) {
            if( swapAndLiquifyMaxAmountEnabled ) {
                contractTokenBalance = numTokensToSell;
            }
            
            swapAndLiquify(contractTokenBalance);
        }
      
        // deduct the transfer fee from the amount
        uint256 transferAmount = amount;

        // calculate liquidity fee and deduct it from the transfer amount
        uint256 liquidityFeeAmount = amount.mul(_liquidityFee).div(10**4);
        if (liquidityFeeAmount > 0) {
            transferAmount = transferAmount.sub(liquidityFeeAmount);
            _balances[address(this)] = _balances[address(this)].add(liquidityFeeAmount);
        }

        // Calculate project fee and deduct it from the transfer amount
        uint256 projectFeeAmount = amount.mul(_projectFee).div(10**4);
        if (projectFeeAmount > 0) {
            transferAmount = transferAmount.sub(projectFeeAmount);
            _balances[address(this)] = _balances[address(this)].add(projectFeeAmount);
        }

        // Transfer the remaining amount after fees have been deducted
        _balances[from] = _balances[from].sub(amount);
        _balances[to] = _balances[to].add(transferAmount);

        // restore all the fees
        restoreAllFees();

        emit Transfer(from, to, transferAmount);
    }

    function swapAndLiquify(uint256 tAmount) private lockTheSwap {
        uint256 totalFee = _liquidityFee.add( _projectFee );
        uint256 forLiquidity = tAmount.mul(_liquidityFee).div(totalFee);
        uint256 forFund = tAmount.sub(forLiquidity);
        
        if(forLiquidity > 0 && _liquidityFee > 0)
        {
            // sell half the tokens for ETH and add liquidity
            uint256 half = forLiquidity.div(2);
            uint256 otherHalf = forLiquidity.sub(half);
    
            uint256 initialBalance = address(this).balance;
            swapTokensForETH(half, address(this) );

            uint256 newBalance = address(this).balance.sub(initialBalance);
            addLiquidity(otherHalf, newBalance);

            emit SwapAndLiquify(half, newBalance, otherHalf);
        }
                
        if(forFund > 0 && _projectFee > 0) 
        {
            // sell tokens for ETH and send to project fund
            uint256 initialBalance = address(this).balance;
            swapTokensForETH(forFund, fundAddress);

            uint256 newBalance = address(this).balance.sub(initialBalance);
           
            emit SwapAndFundProject(newBalance);
        }
    }

    function swapTokensForETH(uint256 tokenAmount, address to) private {
        // generate the pair path of token -> weth 
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapswapV2Router.WETH();

        if( _allowances[ address(this)][address(uniswapswapV2Router)] < tokenAmount )
            _approve(address(this), address(uniswapswapV2Router), tokenAmount);

        // make the swap
        uniswapswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            to,
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ETHAmount) private {        
        if( _allowances[ address(this)][address(uniswapswapV2Router)] < tokenAmount )
            _approve(address(this), address(uniswapswapV2Router), tokenAmount);

        // add the liquidity
        uniswapswapV2Router.addLiquidityETH{value: ETHAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            burnAddress, // LP tokens are burned
            block.timestamp
        );
    }

    function airdropTokens(address[] calldata recipients, uint256[] calldata amounts) external onlyOwner {
        require(recipients.length == amounts.length, "Bad input");

        uint256 totalAmount = 0;
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 amount = amounts[i];

            require(recipient != address(0), "Invalid address");
            require(amount > 0, "Invalid amount");

            totalAmount = totalAmount.add( amount );
   
            _balances[recipient] =  _balances[recipient].add( amount );
        }

        require( totalAmount <= _balances[ address(this)], "Insufficient balance");
        _balances[ address(this) ] = _balances[ address(this) ].sub(totalAmount);
    }


     //to receive ETH from V2Router when swapping
    receive() external payable {}

}
