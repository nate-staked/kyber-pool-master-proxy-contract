
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
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

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.6.0;

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
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
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
        require(c / a == b, "SafeMath: multiplication overflow");

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
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
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
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
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
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
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
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.6.0;




/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol

pragma solidity ^0.6.0;

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
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: smart-contracts/contracts/sol6/Dao/IEpochUtils.sol

pragma solidity 0.6.6;

interface IEpochUtils {
    function epochPeriodInSeconds() external view returns (uint256);

    function firstEpochStartTimestamp() external view returns (uint256);
}

// File: smart-contracts/contracts/sol6/IKyberDAO.sol

pragma solidity 0.6.6;



interface IKyberDAO is IEpochUtils {
    event Voted(address indexed staker, uint indexed epoch, uint indexed campaignID, uint option);
    event RewardClaimed(address indexed staker, uint256 indexed epoch, uint256 percentInPrecision);

    function claimReward(address staker, uint256 epoch) external;

    function getLatestNetworkFeeDataWithCache()
        external
        returns (uint256 feeInBps, uint256 expiryTimestamp);

    function getLatestBRRDataWithCache()
        external
        returns (
            uint256 burnInBps,
            uint256 rewardInBps,
            uint256 rebateInBps,
            uint256 epoch,
            uint256 expiryTimestamp
        );

    function handleWithdrawal(address staker, uint256 penaltyAmount) external;

    function vote(uint256 campaignID, uint256 option) external;

    function getLatestNetworkFeeData()
        external
        view
        returns (uint256 feeInBps, uint256 expiryTimestamp);

    function shouldBurnRewardForEpoch(uint256 epoch) external view returns (bool);
}

// File: contracts/interfaces/IExtendedKyberDAO.sol

pragma solidity 0.6.6;



interface IExtendedKyberDAO is IKyberDAO {
    function getCurrentEpochNumber() external view returns (uint256);

    function getStakerRewardPercentageInPrecision(address staker, uint256 epoch)
        external
        view
        returns (uint256);
}

// File: smart-contracts/contracts/sol6/IKyberFeeHandler.sol

pragma solidity 0.6.6;


interface IKyberFeeHandler {
    event RewardPaid(address indexed staker, uint256 indexed epoch, uint256 amountWei);
    event RebatePaid(address indexed rebateWallet, uint256 amountWei);
    event PlatformFeePaid(address indexed platformWallet, uint256 amountWei);
    event KncBurned(uint256 kncTWei, uint256 amountWei);

    function handleFees(
        address[] calldata eligibleWallets,
        uint256[] calldata rebatePercentages,
        address platformWallet,
        uint256 platformFeeWei
    ) external payable returns (bool);

    function claimReserveRebate(address rebateWallet) external returns (uint256);

    function claimStakerReward(
        address staker,
        uint256 percentageInPrecision,
        uint256 epoch
    ) external returns (bool);
}

// File: contracts/interfaces/IExtendedKyberFeeHandler.sol

pragma solidity 0.6.6;



interface IExtendedKyberFeeHandler is IKyberFeeHandler {
    function rewardsPerEpoch(uint256) external view returns (uint256);
}

// File: smart-contracts/contracts/sol6/Dao/IKyberStaking.sol

pragma solidity 0.6.6;



interface IKyberStaking is IEpochUtils {
    event Delegated(
        address indexed staker,
        address indexed delegatedAddress,
        uint256 indexed epoch,
        bool isDelegated
    );
    event Deposited(uint256 curEpoch, address indexed staker, uint256 amount);
    event Withdraw(uint256 indexed curEpoch, address indexed staker, uint256 amount);

    function initAndReturnStakerDataForCurrentEpoch(address staker)
        external
        returns (
            uint256 _stake,
            uint256 _delegatedStake,
            address _delegatedAddress
        );

    function deposit(uint256 amount) external;

    function delegate(address dAddr) external;

    function withdraw(uint256 amount) external;

    function getStakerDataForPastEpoch(address staker, uint256 epoch)
        external
        view
        returns (
            uint256 _stake,
            uint256 _delegatedStake,
            address _delegatedAddress
        );
}

// File: contracts/KyberPoolMaster.sol

pragma solidity 0.6.6;









/**
 * @title Kayber PoolMaster contract
 * @author Protofire
 */
contract KyberPoolMaster is Ownable {
    using SafeMath for uint256;

    uint256 internal constant MINIMUM_EPOCH_NOTICE = 1;
    uint256 internal constant MAX_DELEGATION_FEE = 10000;
    uint256 internal constant PRECISION = (10**18);

    // Number of epochs after which a change on deledatioFee is will be applied
    uint256 public epochNotice;

    // Mapping of if staker has claimed reward for Epoch
    mapping(uint256 => mapping(address => bool)) public claimedDelegateReward;

    // Mapping of if poolMaster has claimed reward for an epoch for the pool
    mapping(uint256 => bool) public claimedPoolReward;

    // Amount of rewards owed to poolMembers for an epoch
    struct Reward {
        uint256 totalRewards;
        uint256 totalStaked;
    }
    mapping(uint256 => Reward) public memberRewards;

    // Fee charged by poolMasters to poolMembers for services
    // Denominated in 1e4 units
    // 100 = 1%
    struct DFeeData {
        uint256 fromEpoch;
        uint256 fee;
        bool applied;
    }

    DFeeData[] public delegationFees;

    IERC20 public kncToken;
    IExtendedKyberDAO public kyberDAO;
    IKyberStaking public kyberStaking;
    IExtendedKyberFeeHandler public kyberFeeHandler;

    /*** Events ***/
    event CommitNewFees(uint256 deadline, uint256 feeRate);
    event NewFees(uint256 fromEpoch, uint256 feeRate);
    event MemberClaimReward(
        uint256 indexed epoch,
        address indexed poolMember,
        uint256 reward
    );
    event MasterClaimReward(
        uint256 indexed epoch,
        address indexed poolMaster,
        uint256 totalRewards,
        uint256 feeApplied,
        uint256 feeAmount,
        uint256 poolMasterShare
    );

    /**
     * @notice Address deploying this contract should be able to receive ETH, owner can be changed using transferOwnership method
     * @param _kncToken KNC Token address
     * @param _kyberDAO KyberDAO contract address
     * @param _kyberStaking KyberStaking contract address
     * @param _kyberFeeHandler KyberFeeHandler contract address
     * @param _epochNotice Number of epochs after which a change on deledatioFee is will be applied
     * @param _delegationFee Fee charged by poolMasters to poolMembers for services - Denominated in 1e4 units - 100 = 1%
     */
    constructor(
        address _kncToken,
        address _kyberDAO,
        address _kyberStaking,
        address _kyberFeeHandler,
        uint256 _epochNotice,
        uint256 _delegationFee
    ) public {
        require(_kncToken != address(0), "ctor: kncToken is missing");
        require(_kyberDAO != address(0), "ctor: kyberDAO is missing");
        require(_kyberStaking != address(0), "ctor: kyberStaking is missing");
        require(
            _kyberFeeHandler != address(0),
            "ctor: kyberFeeHandler is missing"
        );
        require(
            _epochNotice >= MINIMUM_EPOCH_NOTICE,
            "ctor: Epoch Notice too low"
        );
        require(
            _delegationFee <= MAX_DELEGATION_FEE,
            "ctor: Delegation Fee greater than 100%"
        );

        kncToken = IERC20(_kncToken);
        kyberDAO = IExtendedKyberDAO(_kyberDAO);
        kyberStaking = IKyberStaking(_kyberStaking);
        kyberFeeHandler = IExtendedKyberFeeHandler(_kyberFeeHandler);
        epochNotice = _epochNotice;

        uint256 currEpoch = kyberDAO.getCurrentEpochNumber();

        delegationFees.push(DFeeData(currEpoch, _delegationFee, true));

        emit CommitNewFees(currEpoch, _delegationFee);
        emit NewFees(currEpoch, _delegationFee);
    }

    /**
     * @dev call to stake more KNC for poolMaster
     * @param amount amount of KNC to stake
     */
    function masterDeposit(uint256 amount) external onlyOwner {
        require(
            amount > 0,
            "masterDeposit: amount to deposit should be positive"
        );

        require(
            kncToken.transferFrom(msg.sender, address(this), amount),
            "masterDeposit: can not get token"
        );

        // approve
        kncToken.approve(address(kyberStaking), amount);

        // deposit in KyberStaking
        kyberStaking.deposit(amount);
    }

    /**
     * @dev call to withdraw KNC from staking
     * @param amount amount of KNC to withdraw
     */
    function masterWithdraw(uint256 amount) external onlyOwner {
        require(amount > 0, "masterWithdraw: amount is 0");

        // withdraw from KyberStaking
        kyberStaking.withdraw(amount);

        // transfer KNC back to pool master
        require(
            kncToken.transfer(msg.sender, amount),
            "masterWithdraw: can not transfer knc to the pool master"
        );
    }

    /**
     * @dev  vote for an option of a campaign
     *       options are indexed from 1 to number of options
     * @param campaignID id of campaign to vote for
     * @param option id of options to vote for
     */
    function vote(uint256 campaignID, uint256 option) external onlyOwner {
        kyberDAO.vote(campaignID, option);
    }

    /**
     * @dev  set a new delegation fee to be applyied in current epoch + epochNotice
     * @param _fee new fee
     */
    function commitNewFee(uint256 _fee) external onlyOwner {
        require(
            _fee <= MAX_DELEGATION_FEE,
            "commitNewFee: Delegation Fee greater than 100%"
        );

        uint256 curEpoch = kyberDAO.getCurrentEpochNumber();
        uint256 fromEpoch = curEpoch.add(epochNotice);

        DFeeData storage lastFee = delegationFees[delegationFees.length - 1];

        if (lastFee.fromEpoch > curEpoch) {
            lastFee.fromEpoch = fromEpoch;
            lastFee.fee = _fee;
        } else {
            if (!lastFee.applied) {
                applyFee(lastFee);
            }

            delegationFees.push(DFeeData(fromEpoch, _fee, false));
        }
        emit CommitNewFees(fromEpoch.sub(1), _fee);
    }

    /**
     * @dev Applies the pending new fee
     */
    function applyPendingFee() public {
        DFeeData storage lastFee = delegationFees[delegationFees.length - 1];
        uint256 curEpoch = kyberDAO.getCurrentEpochNumber();

        if (lastFee.fromEpoch <= curEpoch && !lastFee.applied) {
            applyFee(lastFee);
        }
    }

    function applyFee(DFeeData storage fee) internal {
        fee.applied = true;
        emit NewFees(fee.fromEpoch, fee.fee);
    }

    /**
     * @dev Gets the id of the delegation fee corresponding to the given epoch
     * @param epoch for which epoch is querying delegation fee
     */
    function getEpochDFeeDataId(uint256 epoch)
        internal
        view
        returns (uint256 dFeeDataId)
    {
        for (
            dFeeDataId = delegationFees.length - 1;
            dFeeDataId > 0;
            dFeeDataId--
        ) {
            DFeeData memory dFeeData = delegationFees[dFeeDataId];
            if (dFeeData.fromEpoch <= epoch) {
                break;
            }
        }
    }

    /**
     * @dev Gets the the delegation fee data corresponding to the given epoch
     * @param epoch for which epoch is querying delegation fee
     */
    function getEpochDFeeData(uint256 epoch)
        public
        view
        returns (
            uint256 fromEpoch,
            uint256 fee,
            bool applied
        )
    {
        DFeeData memory epochDFee = delegationFees[getEpochDFeeDataId(epoch)];
        fromEpoch = epochDFee.fromEpoch;
        fee = epochDFee.fee;
        applied = epochDFee.applied;
    }

    /**
     * @dev Gets the the delegation fee data corresponding to the current epoch
     */
    function delegationFee()
        public
        view
        returns (
            uint256 fromEpoch,
            uint256 fee,
            bool applied
        )
    {
        uint256 curEpoch = kyberDAO.getCurrentEpochNumber();
        return getEpochDFeeData(curEpoch);
    }

    /**
     * @dev  Queries the amount of unclaimed rewards for the pool
     *       return 0 if PoolMaster has calledRewardMaster
     *       return 0 if staker's reward percentage in precision for the epoch is 0
     *       return 0 if total reward for the epoch is 0
     * @param epoch for which epoch is querying unclaimed reward
     */
    function getUnclaimedRewards(uint256 epoch) public view returns (uint256) {
        if (claimedPoolReward[epoch]) {
            return 0;
        }

        uint256 perInPrecision = kyberDAO.getStakerRewardPercentageInPrecision(
            address(this),
            epoch
        );
        if (perInPrecision == 0) {
            return 0;
        }

        uint256 rewardsPerEpoch = kyberFeeHandler.rewardsPerEpoch(epoch);
        if (rewardsPerEpoch == 0) {
            return 0;
        }

        uint256 unclaimed = rewardsPerEpoch.mul(perInPrecision).div(PRECISION);

        return unclaimed;
    }

    /**
     * @dev  Claims rewards and distribute fees and its share to poolMaster
     * @param epoch for which rewards are being claimed
     */
    function claimRewardsMaster(uint256 epoch) public {
        require(!claimedPoolReward[epoch], "cRMaster: rewards already claimed");

        uint256 unclaimed = getUnclaimedRewards(epoch);

        require(unclaimed > 0, "cRMaster: no rewards to claim");

        uint256 initialBalance = address(this).balance;

        kyberDAO.claimReward(address(this), epoch);

        uint256 totalRewards = address(this).balance.sub(initialBalance);

        (
            uint256 stake,
            uint256 delegatedStake,
            address delegatedAddr
        ) = kyberStaking.getStakerDataForPastEpoch(address(this), epoch);

        DFeeData storage epochDFee = delegationFees[getEpochDFeeDataId(epoch)];

        uint256 totalFee = totalRewards.mul(epochDFee.fee).div(
            MAX_DELEGATION_FEE
        );
        uint256 rewardsAfterFee = totalRewards.sub(totalFee);

        uint256 poolMembersShare = calculateRewardsShare(
            delegatedStake,
            stake.add(delegatedStake),
            rewardsAfterFee
        );
        uint256 poolMasterShare = totalRewards.sub(poolMembersShare); // fee + poolMaster stake share

        claimedPoolReward[epoch] = true;
        memberRewards[epoch] = Reward(poolMembersShare, delegatedStake);

        // distribute poolMasterRewards to poolMaster
        address payable poolMaster = payable(owner());
        require(
            poolMaster.send(poolMasterShare),
            "cRMaste: poolMaster share transfer failed"
        );

        if (!epochDFee.applied) {
            applyFee(epochDFee);
        }

        emit MasterClaimReward(
            epoch,
            poolMaster,
            totalRewards,
            epochDFee.fee,
            totalFee,
            poolMasterShare.sub(totalFee)
        );
    }

    /**
     * @dev  Queries the amount of unclaimed rewards for the pool member
     *       return 0 if PoolMaster has not called claimRewardMaster
     *       return 0 if PoolMember has previously claimed reward for the epoch
     *       return 0 if PoolMember has not stake for the epoch
     *       return 0 if PoolMember has not delegated it stake to this contract for the epoch
     * @param epoch for which epoch the memmber is querying unclaimed reward
     */
    function getUnclaimedRewardsMember(uint256 epoch)
        public
        view
        returns (uint256)
    {
        if (!claimedPoolReward[epoch]) {
            return 0;
        }

        address poolMember = msg.sender;

        if (claimedDelegateReward[epoch][poolMember]) {
            return 0;
        }

        (
            uint256 stake,
            uint256 delegatedStake,
            address delegatedAddr
        ) = kyberStaking.getStakerDataForPastEpoch(poolMember, epoch);

        if (stake == 0) {
            return 0;
        }

        if (delegatedAddr != address(this)) {
            return 0;
        }

        Reward memory rewardForEpoch = memberRewards[epoch];

        return
            calculateRewardsShare(
                stake,
                rewardForEpoch.totalStaked,
                rewardForEpoch.totalRewards
            );
    }

    /**
     * @dev Claims reward for poolMember has not claimed for an epoch previously and the poolMaster has claimed rewards for the pool
     * @param epoch for which rewards are being claimed
     */
    function claimRewardMember(uint256 epoch) public {
        require(
            claimedPoolReward[epoch],
            "cRMember: poolMaster has not claimed yet"
        );

        address poolMember = msg.sender;

        require(
            !claimedDelegateReward[epoch][poolMember],
            "cRMember: rewards already claimed"
        );

        uint256 poolMemberShare = getUnclaimedRewardsMember(epoch);

        require(poolMemberShare > 0, "cRMember: no rewards to claim");

        claimedDelegateReward[epoch][poolMember] = true;

        // distribute poolMember rewards share
        require(
            payable(poolMember).send(poolMemberShare),
            "cRMember: poolMember share transfer failed"
        );

        emit MemberClaimReward(epoch, poolMember, poolMemberShare);
    }

    // Utils
    function calculateRewardsShare(
        uint256 stake,
        uint256 totalStake,
        uint256 rewards
    ) internal pure returns (uint256) {
        return stake.mul(rewards).div(totalStake);
    }

    function delegationFeesLength() public view returns (uint256) {
        return delegationFees.length;
    }

    function claimErc20Tokens(address _token, address _to) external onlyOwner {
        IERC20 token = IERC20(_token);
        uint256 balance = token.balanceOf(address(this));
        SafeERC20.safeTransfer(token, _to, balance);
    }

    receive() external payable {
        require(
            msg.sender == address(kyberFeeHandler),
            "only accept ETH from Kyber"
        );
    }
}