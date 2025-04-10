page 52193651 "PR Payroll Access Rights"
{

    Caption = 'PR Payroll Access Rights';
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "PR Payroll Access Rights";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Authorized; Rec.Authorized)
                {
                    ApplicationArea = All;
                }
                field("Can Edit Transactions"; Rec."Can Edit Transactions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Can Edit Transactions field.';
                }

                field("Last Modified By"; "Last Modified By")
                {
                    ApplicationArea = all;
                }

                field("Last DateTime Modified"; "Last DateTime Modified")
                {

                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
            }
        }
    }

}
