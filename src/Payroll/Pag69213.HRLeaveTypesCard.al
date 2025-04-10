

page 52194285 "HR Leave Types Card"
{
    PageType = Card;
    SourceTable = "HR Leave Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days field.';
                    trigger OnValidate()
                    begin
                        Message(Format(SessionId));
                    end;
                }
                field("Attachment Mandatory"; Rec."Attachment Mandatory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Mandatory field.';
                }
                field("Acrue Days"; Rec."Acrue Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acrue Days field.';
                }
                field("Unlimited Days"; Rec."Unlimited Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unlimited Days field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Carry Forward Days field.';
                }
                field("Max Carry Forward 2"; Rec."Max Carry Forward 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max Carry Forward Over 55 field.', Comment = '%';
                }
                field("Carry Forward Allowed"; Rec."Carry Forward Allowed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Carry Forward Allowed field.';
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inclusive of Non Working Days field.';
                }
                field("Grace Period(in Days )"; Rec."Grace Period(in Days )")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grace Period(in Days ) field.';
                }
                field("Multiple Allocations"; Rec."Multiple Allocations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = Basic;
                }
                field("Hardship Grace Period"; Rec."Hardship Grace Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hardship Grace Period field.';
                }

                field("Detailed Description"; Rec."Detailed Description")
                {
                    ApplicationArea = Basic;
                }
                field(Adoption; Rec.Adoption)
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

#pragma implicitwith restore

