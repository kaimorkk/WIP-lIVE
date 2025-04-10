

page 95126 "Compliance Framework Categorie"
{
    CardPageID = "Compliance Framework Category";
    PageType = List;
    SourceTable = "Compliance Framework Category";

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
                field("No. of Compliance Frameworks"; Rec."No. of Compliance Frameworks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Compliance Frameworks field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

