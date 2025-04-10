

page 75307 "IFS Tender Committe Entry"
{
    PageType = List;
    SourceTable = "IFS Tender Committe Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Tender Opening Date field.';
                }
                field("Tender Opeing Time"; Rec."Tender Opeing Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Tender Opeing Time field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

