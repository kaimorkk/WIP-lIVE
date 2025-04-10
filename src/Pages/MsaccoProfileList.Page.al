Page 52193449 "Msacco Profile List"
{
    CardPageID = "Msacco Profile Card";
    PageType = List;
    SourceTable = "Msacco User Profile";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(UserName;UserName)
                {
                    ApplicationArea = Basic;
                }
                field(Password;Password)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(Reset;Reset)
                {
                    ApplicationArea = Basic;
                }
                field(Locked;Locked)
                {
                    ApplicationArea = Basic;
                }
                field(FailedAttempts;FailedAttempts)
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;CreationDate)
                {
                    ApplicationArea = Basic;
                }
                field(MemberNo;MemberNo)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

