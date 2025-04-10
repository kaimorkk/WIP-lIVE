Page 52194171 "Sick Off List"
{
    ApplicationArea = Basic;
    CardPageID = "Sick  Off";
    PageType = List;
    SourceTable = "Sick Off1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SickofNo;"Sick of No.")
                {
                    ApplicationArea = Basic;
                }
                field(SickoffDateFrom;"Sick off Date(From)")
                {
                    ApplicationArea = Basic;
                }
                field(SickOffDateTo;"Sick Off Date(To)")
                {
                    ApplicationArea = Basic;
                }
                field(Sickoffentitlement;"Sick off entitlement")
                {
                    ApplicationArea = Basic;
                }
                field(Offdaysdue;"Off days due")
                {
                    ApplicationArea = Basic;
                }
                field(DaysTaken;"Days Taken")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(HospitalName;"Hospital Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

