Page 52194172 "Employee Absentism Line"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Employee Absentism1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AbsentNo;"Absent No.")
                {
                    ApplicationArea = Basic;
                }
                field(Absentismcode;"Absentism code")
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
                field(NoofDaysAbsent;"No. of  Days Absent")
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

