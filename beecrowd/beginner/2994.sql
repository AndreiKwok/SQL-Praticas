select d.name, round(sum((at.hours * 150) * (1 + ws.bonus/ 100)), 1) 
as salary
from attendances at
join doctors d on at.id_doctor = d.id
join work_shifts ws on at.id_work_shift = ws.id
group by d.name
order by salary desc;