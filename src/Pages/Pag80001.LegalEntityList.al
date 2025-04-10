

page 80001 "Legal Entity List"
{
    CardPageID = "Legal Entity Card";
    PageType = List;
    SourceTable = "Company Information";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the company''s name and corporate form. For example, Inc. or Ltd.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the company''s address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the company''s telephone number.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the company''s city.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

