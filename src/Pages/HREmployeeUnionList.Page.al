Page 52194073 "HR Employee Union List"
{
    PageType = List;
    SourceTable = "HR Employee Unions1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName; FullName1("Employee No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field(UnionName; "Union Name")
                {
                    ApplicationArea = Basic;
                }
                field(ShopSteward; "Shop Steward")
                {
                    ApplicationArea = Basic;
                }
                field(UnionJoinDate; "Union Join Date")
                {
                    ApplicationArea = Basic;
                }
                field(UnionNumber; "Union Number")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control20)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19061446;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Unions)
            {
                Caption = 'Unions';
                // action(UnionCard)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Union Card';
                //     RunObject = Page "Position Requirements";
                //     RunPageLink = "Job Id"=field("Employee No.");
                //     ShortCutKey = 'Shift+Ctrl+L';
                // }
            }
        }
    }

    var
        Text19061446: label 'Unions List';


    procedure FullName1(EmployeeNumber: Code[20]) Name: Text[150]
    var
        Employee: Record Employee;
        OK: Boolean;
    begin
        OK := Employee.Get("Employee No.");
        if OK then Name := Employee.FullName();
    end;
}

