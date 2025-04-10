

page 72008 "Counties"
{
    PageType = List;
    SourceTable = County;
    UsageCategory = Administration;
    ApplicationArea = All;

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


            }
        }
    }

    actions
    {
        area(processing)
        {
            action(New)
            {
                ApplicationArea = Basic;
                Caption = 'Sub County';
                Image = New;
                RunObject = Page "Sub County";
                RunPageLink = County = field(Code);
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(New_Promoted; New)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

