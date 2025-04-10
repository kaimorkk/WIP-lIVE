page 96061 "Received Alerts"
{
    ApplicationArea = All;
    Caption = 'Received Alerts';
    PageType = List;
    SourceTable = "Received Alerts";
    UsageCategory = None;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field(Username; Rec.Username)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Username field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Sent Content"; Rec."Sent Content")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sent Content field.', Comment = '%';
                }
                field("Alert Type"; Rec."Alert Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alert Type field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Received field.', Comment = '%';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
}
