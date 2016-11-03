using Compat

const PG_COPYRES_ATTRS = 0x01
const PG_COPYRES_TUPLES = 0x02
const PG_COPYRES_EVENTS = 0x04
const PG_COPYRES_NOTICEHOOKS = 0x08

const PQnoPasswordSupplied = "fe_sendauth: no password supplied\n"

"ConnStatusType"
const CONNECTION_OK = (UInt32)(0)
const CONNECTION_BAD = (UInt32)(1)
const CONNECTION_STARTED = (UInt32)(2)
const CONNECTION_MADE = (UInt32)(3)
const CONNECTION_AWAITING_RESPONSE = (UInt32)(4)
const CONNECTION_AUTH_OK = (UInt32)(5)
const CONNECTION_SETENV = (UInt32)(6)
const CONNECTION_SSL_STARTUP = (UInt32)(7)
const CONNECTION_NEEDED = (UInt32)(8)

"PostgresPollingStatusType"
const PGRES_POLLING_FAILED = (UInt32)(0)
const PGRES_POLLING_READING = (UInt32)(1)
const PGRES_POLLING_WRITING = (UInt32)(2)
const PGRES_POLLING_OK = (UInt32)(3)
const PGRES_POLLING_ACTIVE = (UInt32)(4)

"ExecStatusType"
const PGRES_EMPTY_QUERY = (UInt32)(0)
const PGRES_COMMAND_OK = (UInt32)(1)
const PGRES_TUPLES_OK = (UInt32)(2)
const PGRES_COPY_OUT = (UInt32)(3)
const PGRES_COPY_IN = (UInt32)(4)
const PGRES_BAD_RESPONSE = (UInt32)(5)
const PGRES_NONFATAL_ERROR = (UInt32)(6)
const PGRES_FATAL_ERROR = (UInt32)(7)
const PGRES_COPY_BOTH = (UInt32)(8)
const PGRES_SINGLE_TUPLE = (UInt32)(9)

"PGTransactionStatusType"
const PQTRANS_IDLE = (UInt32)(0)
const PQTRANS_ACTIVE = (UInt32)(1)
const PQTRANS_INTRANS = (UInt32)(2)
const PQTRANS_INERROR = (UInt32)(3)
const PQTRANS_UNKNOWN = (UInt32)(4)

"PGVerbosity"
const PQERRORS_TERSE = (UInt32)(0)
const PQERRORS_DEFAULT = (UInt32)(1)
const PQERRORS_VERBOSE = (UInt32)(2)

"PGPing"
const PQPING_OK = (UInt32)(0)
const PQPING_REJECT = (UInt32)(1)
const PQPING_NO_RESPONSE = (UInt32)(2)
const PQPING_NO_ATTEMPT = (UInt32)(3)
