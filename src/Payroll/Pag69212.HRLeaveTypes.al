

page 52194250 "HR Leave Types"
{
    CardPageID = "HR Leave Types Card";
    PageType = List;
    SourceTable = "HR Leave Types";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Inclusive of Holidays"; Rec."Inclusive of Holidays")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Holidays field.';
                }
                field("Inclusive of Saturday"; Rec."Inclusive of Saturday")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Saturday field.';
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual field.';
                }

                field("Inclusive of Sunday"; Rec."Inclusive of Sunday")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Sunday field.';
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Carry Forward Days field.';
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Non Working Days field.';
                }
                field("Hardship Grace Period"; Rec."Hardship Grace Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hardship Grace Period field.';
                }
                field("Attachment Mandatory"; Rec."Attachment Mandatory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Mandatory field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755003; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1102755004; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

#pragma implicitwith restore

