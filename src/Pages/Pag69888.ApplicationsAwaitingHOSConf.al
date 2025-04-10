page 69888 "Applications Awaiting HOS Conf"
{

    Caption = 'Transfers Awaiting HOS';
    PageType = List;
    CardPageId = "Apps Awaiting HOS Conf";
    SourceTable = "Employee Transfers";
    UsageCategory = None;
    Editable = false;
    SourceTableView = where(Type = const("Management initiated"), "Document Type" = const(Application),
                            "Status" = filter("Awaiting HOS"), Posted = const(false));

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
                field("Requestor Employee No"; Rec."Requestor Employee No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor Employee No field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Requestor Job Title"; Rec."Requestor Job Title")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
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
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        Employee.Get(UserSetup."Employee No.");
        if not Employee."Head of Station" then
            Error('This document is only visible to heads of duty stations.');
        Rec.SetFilter("New Station", Employee."Current Duty Station");
        Rec.FindSet();
    end;

    var
        Employee: Record Employee;
}
