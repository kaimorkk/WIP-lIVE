Report 52193587 "Suggest Clearance Items"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee;Employee)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(ReportForNavId_7528; 7528)
            {
            }
            dataitem("Employee Account Mapping1";"Employee Account Mapping1")
            {
                DataItemLink = "Employee No."=field("No.");
                DataItemTableView = sorting("Employee No.","Loan Type");
                column(ReportForNavId_1124; 1124)
                {
                }

                trigger OnAfterGetRecord()
                begin
                      if Cust.Get("Employee Account Mapping1"."Customer A/c") then
                      begin
                      Cust.CalcFields(Cust."Balance (LCY)");
                      if Cust."Balance (LCY)">0 then
                      begin
                        SeparationLines.Init;
                        SeparationLines."Employee No":="Employee Account Mapping1"."Employee No.";
                        SeparationLines."Line No":=SeparationLines."Line No"+10000;
                        SeparationLines."Item Description":=StrSubstNo('%1 Balance of %2',"Employee Account Mapping1"."Loan Type",Cust."Balance (LCY)");
                        SeparationLines.Insert;
                      end;
                      end;
                end;
            }
            dataitem("Misc. Article Information";"Misc. Article Information")
            {
                DataItemLink = "Employee No."=field("No.");
                DataItemTableView = sorting("Employee No.","Misc. Article Code","Line No.");
                column(ReportForNavId_4668; 4668)
                {
                }

                trigger OnAfterGetRecord()
                begin


                        if "Misc. Article Information"."To Date"=0D then
                        begin

                        SeparationLines.Init;
                        SeparationLines."Employee No":="Misc. Article Information"."Employee No.";
                        SeparationLines."Line No":=SeparationLines."Line No"+10000;
                        SeparationLines."Item Description":=StrSubstNo('%1 Serial No/No %2',"Misc. Article Information".Description,
                        "Misc. Article Information"."Serial No.");
                        SeparationLines.Insert;
                        end;
                end;
            }
            dataitem("Employee Leaves1";"Employee Leaves1")
            {
                DataItemLink = "Employee No"=field("No.");
                DataItemTableView = sorting("Employee No","Leave Code","Maturity Date");
                column(ReportForNavId_7387; 7387)
                {
                }

                trigger OnAfterGetRecord()
                begin

                        if (("Employee Leaves1".Entitlement+"Employee Leaves1"."Recalled Days"+
                        "Employee Leaves1"."Balance Brought Forward"-"Employee Leaves1"."Total Days Taken")>0) then
                        begin

                        SeparationLines.Init;
                        SeparationLines."Employee No":="Employee Leaves1"."Employee No";
                        SeparationLines."Line No":=SeparationLines."Line No"+10000;
                        SeparationLines."Item Description":=StrSubstNo('Leave balance of %1',
                        ("Employee Leaves1".Entitlement+"Employee Leaves1"."Recalled Days"+
                        "Employee Leaves1"."Balance Brought Forward"-"Employee Leaves1"."Total Days Taken"));
                        SeparationLines.Insert;
                        end;
                end;

                trigger OnPreDataItem()
                begin






                         PayrollPeriod.Reset;
                         PayrollPeriod.SetRange(PayrollPeriod."Starting Date",0D,Today);
                         PayrollPeriod.SetRange(PayrollPeriod."New Fiscal Year",true);
                         if PayrollPeriod.Find('+') then
                         maturityDate:=CalcDate('1Y',PayrollPeriod."Starting Date")-1;
                         "Employee Leaves1".SetRange("Employee Leaves1"."Maturity Date",maturityDate);
                         // MESSAGE('%1',maturityDate);
                end;
            }
            dataitem("Fixed Asset";"Fixed Asset")
            {
                DataItemLink = "Responsible Employee"=field("No.");
                DataItemTableView = sorting("No.");
                column(ReportForNavId_3794; 3794)
                {
                }

                trigger OnAfterGetRecord()
                begin




                        SeparationLines.Init;
                        SeparationLines."Employee No":="Fixed Asset"."Responsible Employee";
                        SeparationLines."Line No":=SeparationLines."Line No"+10000;
                        SeparationLines."Item Description":=StrSubstNo('%1 Asset No %2',"Fixed Asset".Description,"Fixed Asset"."No.");
                        SeparationLines.Insert;
                end;
            }
            dataitem("Book Issue Details1";"Book Issue Details1")
            {
                DataItemLink = "Borrower No."=field("No.");
                DataItemTableView = sorting(Code,"Request No") where("Returned?"=const(false));
                column(ReportForNavId_7942; 7942)
                {
                }

                trigger OnAfterGetRecord()
                begin




                        SeparationLines.Init;
                        SeparationLines."Employee No":="Book Issue Details1"."Borrower No.";
                        SeparationLines."Line No":=SeparationLines."Line No"+10000;
                        SeparationLines."Item Description":=StrSubstNo('%1 Book No %2',"Book Issue Details1"."Book Description",
                        "Book Issue Details1"."Book No");
                        SeparationLines.Insert;
                end;
            }
            dataitem("Mail/Document Movement1";"Mail/Document Movement1")
            {
                DataItemLink = "Employee No."=field("No.");
                DataItemTableView = sorting("Movement Code",Mail,Document,File,Volume);
                column(ReportForNavId_5413; 5413)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                   SeparationLines.Reset;
                   SeparationLines.SetRange(SeparationLines."Employee No",Employee."No.");
                   SeparationLines.DeleteAll;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SeparationLines: Record "Separation Lines1";
        Cust: Record Customer;
        EmpLeave: Record "Employee Leaves1";
        maturityDate: Date;
        PayrollPeriod: Record "Payroll PeriodX1";
}

