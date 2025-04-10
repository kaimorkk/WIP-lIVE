Page 50015 "HOD Employee Absence List"
{
    CardPageID = "Employee Absentism";
    PageType = List;
    SourceTable = "Employee Absentism1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(AbsentFrom;"Absent From")
                {
                    ApplicationArea = Basic;
                }
                field(AbsentTo;"Absent To")
                {
                    ApplicationArea = Basic;
                }
                field(Absentismcode;"Absentism code")
                {
                    ApplicationArea = Basic;
                }
                field(NoofDaysAbsent;"No. of  Days Absent")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(AbsentNo;"Absent No.")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforAbsentism;"Reason for Absentism")
                {
                    ApplicationArea = Basic;
                }
                field(Penalty;Penalty)
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

