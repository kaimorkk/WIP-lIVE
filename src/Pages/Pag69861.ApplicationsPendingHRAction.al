page 69861 "Applications Pending HR Action"
{
    Caption = 'Applications Pending HR Approval';
    PageType = List;
    CardPageId = "Awaiting HR Action";
    SourceTable = "Employee Transfers";
    UsageCategory = None;
    Editable = false;
    SourceTableView = where(Type = const("Self initiated"), "Document Type" = const(Application),
                            "Status" = filter("Pending HR Approval"), Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Date field.';
                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }
                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Station field.';
                }
                field("New Sattion Name"; Rec."New Sattion Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Sattion Name field.';
                }
                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }

                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        HRSetup.Get();
        // HRSetup.TestField("HR Director");
        // if UserId <> HRSetup."HR Director" then
        //     Error('This page is only accessible to the HR Director');

    end;

    var
        HRSetup: Record "Human Resources Setup";
}
