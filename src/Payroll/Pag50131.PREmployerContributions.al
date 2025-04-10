page 52193914 "PR Employer Contributions"
{
    ApplicationArea = All;
    Caption = 'PR Employer Contributions';
    PageType = List;
    SourceTable = "PR Employer Deductions";
    UsageCategory = Lists;
    //Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = CanEdit;
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        PayrollRights.Reset();
        PayrollRights.SetRange(PayrollRights."User ID", UserId);
        if PayrollRights.Find('-') then
            CanEdit := PayrollRights."Can Edit Transactions";
    end;

    var
        PayrollRights: Record "PR Payroll Access Rights";
        CanEdit: Boolean;
}
