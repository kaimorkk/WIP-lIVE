

page 56020 "Copyright Categories"
{
    PageType = List;
    SourceTable = "Copyright Works Categories";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Authentication Devices"; Rec."Authentication Devices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Devices field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Copyright Right Sub-Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Copyright Right Sub-Categories';
                Image = Task;
                RunObject = Page "Copyright Sub-Categories Setup";
                RunPageLink = "Category Code" = field(Code);
                ToolTip = 'Executes the Copyright Right Sub-Categories action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Copyright Right Sub-Categories_Promoted"; "Copyright Right Sub-Categories")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

