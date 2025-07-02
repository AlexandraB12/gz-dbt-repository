with source as (
    select * from {{ ref('int_campaigns') }}

)

select
    date_date,
    sum(ads_cost) as daily_ads_cost,
    sum(impression) as daily_impressions,
    sum(click) as daily_clicks
from source
group by date_date
order by date_date desc