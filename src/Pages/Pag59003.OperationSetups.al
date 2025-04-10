

page 59003 "Operation Setups"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Management Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Req No"; Rec."Transport Req No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Transport Req No field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field("Fuel Register"; Rec."Fuel Register")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Fuel Register field.';
                }
                field("Maintenance Request"; Rec."Maintenance Request")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Maintenance Request field.';
                }
                field("Vehicle Inspection No"; Rec."Vehicle Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Inspection No field.';
                }
                field("Contract  No"; Rec."Contract  No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Contract  No field.';
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    ToolTip = 'Specifies the value of the Fuel Card No field.';
                }
                field("Transport Req Gate Pass No"; Rec."Transport Req Gate Pass No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gate Pass Serial Numbers';
                    ToolTip = 'Specifies the value of the Gate Pass Serial Numbers field.';
                }
                field("Project Accountant Email"; Rec."Project Accountant Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Accountant Email field.';
                }
                field("HOD E-Mail Address"; Rec."HOD E-Mail Address")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the HOD E-Mail Address field.';
                }
                field("Transport Admin Email"; Rec."Transport Admin Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Admin Email field.';
                }
            }
            group("Project Reimbusment Setup")
            {
                Caption = 'Project Reimbusment Setup';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Sender Email"; Rec."Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Email field.';
                }
                field("Licence Expiry Notice Period"; Rec."Licence Expiry Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Expiry Notice Period field.';
                }
                field("Main Funds Bank A/C"; Rec."Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Funds Bank A/C field.';
                }
                field("Transfer-To Job No"; Rec."Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Job No field.';
                }
                field("Transfer-To Task No"; Rec."Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Task No field.';
                }
                field("Transfer-To Income G/L A/C"; Rec."Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Income G/L A/C field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

