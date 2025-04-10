

page 69449 "HSE Plan Sections"
{
    CardPageID = "HSE Plan Section";
    PageType = List;
    SourceTable = "HSE Plan Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'OSH Plan Overviw';
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Revision Date"; Rec."Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Date field.';
                }
                field("No. of Comments"; Rec."No. of Comments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
                field("No. of Initiatives"; Rec."No. of Initiatives")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Initiatives field.';
                }
                field("No. of Guiding Principle Stmts"; Rec."No. of Guiding Principle Stmts")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Guiding Principle Stmts field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Additional Comments")
            {
                ApplicationArea = Basic;
                Image = Comment;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Additional Comments action.';
            }
            action("Key OSH Initiatives")
            {
                ApplicationArea = Basic;
                Caption = 'Key OSH Initiatives';
                Image = Installments;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Key OSH Initiatives action.';
            }
            action("Guiding Principle Statements")
            {
                ApplicationArea = Basic;
                Image = GiroPlus;
                RunObject = Page "HSE Plan Section Details";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = field("Section Type"),
                              "Section Line No." = field("Line No.");
                ToolTip = 'Executes the Guiding Principle Statements action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Additional Comments_Promoted"; "Additional Comments")
                {
                }
                actionref("Key OSH Initiatives_Promoted"; "Key OSH Initiatives")
                {
                }
                actionref("Guiding Principle Statements_Promoted"; "Guiding Principle Statements")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

