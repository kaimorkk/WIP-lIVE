

page 80420 "Innovation Setup Card"
{
    PageType = Card;
    SourceTable = "Innovation Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Inno Email"; Rec."Default Inno Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Inno Email field.';
                }
            }
            group("Number Series")
            {
                field("Idea Invitation Nos"; Rec."Idea Invitation Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Invitation Nos field.';
                }
                field("Idea Capture Form Nos."; Rec."Idea Capture Form Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Idea Capture Form Nos. field.';
                }
                field("Inno Committee Voucher Nos."; Rec."Inno Committee Voucher Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inno Committee Voucher Nos. field.';
                }
                field("Inno Evaluation Nos"; Rec."Inno Evaluation Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inno Evaluation Nos field.';
                }
                field("Inno Reward Nos."; Rec."Inno Reward Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inno Reward Nos. field.';
                }
                field("No. of Innov Invitations"; Rec."No. of Innov Invitations")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Invitations field.';
                }
                field("No. of Innov Ideas"; Rec."No. of Innov Ideas")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Ideas field.';
                }
                field("No. of Innov Comm Appointments"; Rec."No. of Innov Comm Appointments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Comm Appointments field.';
                }
                field("No. of Innov Evaluations"; Rec."No. of Innov Evaluations")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innov Evaluations field.';
                }
                field("No. of Innovation Rewards"; Rec."No. of Innovation Rewards")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innovation Rewards field.';
                }
                field("No. of Innovation Projects"; Rec."No. of Innovation Projects")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Innovation Projects field.';
                }
                field("Inno Template Nos"; Rec."Inno Template Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inno Template Nos field.';
                }
                field("Inno Eval Committe  Nos."; Rec."Inno Eval Committe  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inno Eval Committe  Nos. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

