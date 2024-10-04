select DATE_PART('month', d.deal_date) mon,
sum(d.confirm_qty * d.price) qty,
o.branch_code
from deal d, ord o, ae, dept
where d.status = 'A'
and o.status = 'A'
and DATE_PART('year', d.deal_date) = '2013'
and d.deal_date = o.order_date
and d.order_no = o.order_no
and d.x_order_no = o.x_order_no
and ae.ae_code = o.ae_code
and ae.dept_id = dept.id
group by DATE_PART('month', d.deal_date), o.branch_code, dept.id
