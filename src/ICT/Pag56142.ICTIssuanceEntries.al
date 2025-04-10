

page 56142 "ICT Issuance Entries"
{
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Entries";
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use start date field.';
                }
                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use end date field.';
                }
                field("Duration of Use"; Rec."Duration of Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use field.';
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No field.';
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason';
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To User ID field.';
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field("Branches Code"; Rec."Branches Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branches Code field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Division/Unit"; Rec."Division/Unit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division/Unit field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Previously Assigned To"; Rec."Previously Assigned To")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previously Assigned Employee';
                    ToolTip = 'Specifies the value of the Previously Assigned Employee field.';
                }
                field("Previously Assigned Dpt"; Rec."Previously Assigned Dpt")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previously Assigned Department';
                    ToolTip = 'Specifies the value of the Previously Assigned Department field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

