report 52193624 "New Employees1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/New Employees.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Employment Date", "Employee Category Type";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(STRSUBSTNO__PERIOD___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____; StrSubstNo('PERIOD: %1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))))
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(First_Name_______Middle_Name________Last_Name_; Employee.fullname())
            {
            }
            column(Job_Title2; "Job Title2")
            {

            }
            column(Employment_Date; "Employment Date")
            {

            }
            column(Current_Duty_Station; "Current Duty Station")
            {

            }
            column(Counter; Counter)
            {
            }
            column(NEW_EMPLOYEESCaption; NEW_EMPLOYEESCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_PhoneNo; CompInfo."Phone No.")
            {
            }
            column(StationName; StationName)
            {

            }
            column(CurrentJobGrade_Employee; "Current Job Grade")
            {
            }
            column(Present_Employee; Present)
            {
            }
            column(PeriodName; PeriodName)
            { }
            trigger OnPreDataItem()
            begin
                Employee.SetFilter("Employment Date", '%1..%2', Payperiod - 31, Payperiod);
                PeriodName := '';
                PRPayrollPeriod.Reset();
                PRPayrollPeriod.SetRange("Date Opened", PayPeriod);
                if PRPayrollPeriod.FindFirst() then begin
                    PeriodName := PRPayrollPeriod."Period Name";
                end;
            end;

            trigger OnAfterGetRecord()
            begin
                //Employee.SetFilter("Date Of Leaving", '%1..%2', Payperiod, Payperiod + 30);
                DutyStation.Reset();
                if DutyStation.Get("Current Duty Station") then
                    StationName := DutyStation.Description;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(PayPeriod; Payperiod)
                    {
                        ApplicationArea = All;
                        TableRelation = "PR Payroll Periods"."Date Opened";
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }



    var
        // AssignMat: Record "Assignment Matrix-X";
        LastMonth: Date;
        Thismonth: Date;
        FoundThismonth: Boolean;
        FoundLastmonth: Boolean;
        Counter: Integer;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        NEW_EMPLOYEESCaptionLbl: Label 'NEW EMPLOYEES';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NameCaptionLbl: Label 'Name';
        DutyStation: Record "Duty Station";
        StationName: Text[150];
        CompInfo: Record "Company Information";
        Payperiod: Date;
        PRPayrollPeriod: Record "PR Payroll Periods";
        PeriodName: Text;
}

