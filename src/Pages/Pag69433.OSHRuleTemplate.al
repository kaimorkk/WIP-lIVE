

page 69433 "OSH Rule Template"
{
    PageType = Card;
    SourceTable = "OSH Rule Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control7; "OSH Rule Template Lines")
            {
                Caption = 'Safety Rules & Regulations';
                SubPageLink = "Template ID" = field("Template ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Rules & Regulation Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Rules & Regulation Categories';
                Image = RegisterPick;
                RunObject = Page "OSH Rule Template Categories";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Rules & Regulation Categories action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Rules & Regulation Categories_Promoted"; "Rules & Regulation Categories")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

