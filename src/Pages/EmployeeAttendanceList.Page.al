Page 52193828 "Employee Attendance List"
{
    PageType = ListPart;
    SourceTable = "Employee Committee1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CustomerNo;"Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer No.';
                }
                field(CustomerName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer Name';
                }
                field(Attended;Attended)
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

