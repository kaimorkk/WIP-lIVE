

page 69289 "Hr Case Witness"
{
    PageType = List;
    SourceTable = "Hr Case Witness";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Witness is Staff"; Rec."Witness is Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness is Staff field.';
                }
                field("Witness Number"; Rec."Witness Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Number field.';
                }
                field("Witness Name"; Rec."Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Name field.';
                }
                field("Witness Statement"; Rec."Witness Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Statement field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

