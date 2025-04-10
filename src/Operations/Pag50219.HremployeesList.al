namespace ALProjectLIWPA.ALProjectLIWPA;


page 52194407 "Hr Employee Registration List"
{
    ApplicationArea = All;
    Caption = 'Wip Registration List';
    PageType = List;
    SourceTable = "Wip Header Registration";
    UsageCategory = Lists;
    CardPageId = "HR Employee Registration Crd";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Contract Type"; "Contract Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the contract type';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Highest Leverl Description"; Rec."Highest Leverl Description")
                {
                    ToolTip = 'Specifies the value of the Highest Leverl Description field.', Comment = '%';
                    Visible = false;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ToolTip = 'Specifies the value of the ID Number field.', Comment = '%';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ToolTip = 'Specifies the value of the Job ID field.', Comment = '%';
                    Visible = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.', Comment = '%';
                    Visible = false;
                }
            }
        }
    }
}
