WITH dates AS (
    SELECT distinct dt_repotr
    FROM test where dt_repotr between '2020-06-01' and '2020-09-30'
),
login_values AS (
    SELECT  login,row_number FROM test 
),
server_values AS (
    SELECT DISTINCT server FROM test
),
symbol_values AS (
    SELECT DISTINCT symbol FROM test
),
currency_values AS (
    SELECT DISTINCT currency FROM test
)

-- 笛卡尔积生成所有组合
SELECT 
    d.dt_report,
    l.login,
    s.server,
    sy.symbol,
    c.currency
FROM 
    dates d
CROSS JOIN 
    login_values l
CROSS JOIN 
    server_values s
CROSS JOIN 
    symbol_values sy
CROSS JOIN 
    currency_values c
ORDER BY 
   l.row_number;
