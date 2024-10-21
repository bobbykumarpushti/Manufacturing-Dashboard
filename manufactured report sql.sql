create database manufacturing_report;
use manufacturing_report;

-- Total Manufactured Quantity --
select format(sum(TotalQty),'no') as Total_Manufactured_Quantity from manufacturing_report;

-- Total Rejected Quantity --
select format(sum(RejectedQty),'no') as Total_Rejected_Quantity from manufacturing_report;

-- Total Processed Quantity --
select format(sum(ProcessedQty),'no') as Total_Processed_Quantity from manufacturing_report;

-- Wastage Percentage --
select concat(format(sum(rejectedqty/processedqty)/100,3),"%") as Wastage_Percentage from manufacturing_report; 

-- Wastage Quantity --
select format(sum(ProducedQty - ProcessedQty),'no') AS Wastage_Quantity from manufacturing_report;

-- Emp wise Manufactured vs Rejected --
select empname , format(sum(totalqty),'no') as ManufacturedQty ,format(sum(rejectedqty),'no') as Rejected_Qty from manufacturing_report group by 
empname order by Rejected_Qty desc ; 

-- Machine wise Manufactured vs Rejected --
select machinecode ,format(sum(totalqty),'no') as ManufacturedQty ,format(sum(rejectedqty),'no') as Rejected_Qty from manufacturing_report group by
 machinecode order by RejectedQty desc limit 10 ; 
 
 -- Manufactured vs Rejected over time --
 select monthname(docdate) as month, format(sum(totalqty), 'no') as manufactured_qty, format(sum(rejectedQty), 'no') as rejected_qty from
 manufacturing_report group by month(docdate), monthname(docdate) order by month(docdate);

-- Dept wise Manufactured vs Rejected --
select departmentname ,format(sum(TotalQty),'no') as Manufactured_Qty ,format(sum(RejectedQty),'no') as Rejected_Qty from manufacturing_report 
group by departmentname order by RejectedQty desc ; 

-- Brand wise Manufactured vs Rejected --
select buyer as Brand,format(sum(TotalQty),'no') as ManufacturedQty ,format(sum(RejectedQty),'no') as Rejected_Qty from manufacturing_report group by buyer
order by Rejected_Qty desc ;

-- Employee wise Rejected Qty --
select EmpName, format(sum(RejectedQty),'no') as Total_Rejected_Quantity from manufacturing_report group by EmpName;

-- Machine wise Rejected Qty --
SELECT MachineCode, format(SUM(RejectedQty),'no') AS Total_Rejected_Quantity FROM manufacturing_report GROUP BY MachineCode;

-- Production Comparison trend --
SELECT DocDate, format(SUM(ProducedQty),'no') AS Total_Produced_Quantity FROM manufacturing_report GROUP BY DocDate ORDER BY DocDate;

-- Manufacture vs Rejected --
SELECT format(SUM(totalqty),'no') AS Total_Manufactured, format(SUM(RejectedQty),'no') AS Total_Rejected FROM manufacturing_report;


