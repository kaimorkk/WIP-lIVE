

page 75129 "IFS Required Document"
{
    PageType = List;
    SourceTable = "IFS Required Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Procurement Document Type ID"; Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Certificate Expiry field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }

            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

