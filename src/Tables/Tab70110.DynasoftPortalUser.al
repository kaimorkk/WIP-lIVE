
table 70110 "Dynasoft Portal User"
{
    Caption = 'Judiciary Portal User';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "User Name"; Text[60])
        {
            Description = 'User Names shall by default be email addresses. However, for scalability, we maintain a separate authentication email just in case we use a different User name';
        }
        field(3; "Full Name"; Text[100])
        {
        }
        field(4; "Authentication Email"; Text[80])
        {

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("Authentication Email");
            end;
        }
        field(5; "Mobile Phone No."; Text[300])
        {

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Mobile Phone No.") do
            //       if Char.IsLetter("Mobile Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(6; State; Option)
        {
            OptionCaption = 'Enabled,Disabled';
            OptionMembers = Enabled,Disabled;
        }
        field(7; "Change Password"; Boolean)
        {
        }
        field(8; "Record Type"; Option)
        {
            OptionCaption = ',Vendor,Customer,Employee,Job Applicant';
            OptionMembers = ,Vendor,Customer,Employee,"Job Applicant";
        }
        field(9; "Record ID"; Code[30])
        {
        }
        field(10; "Password Value"; Text[30])
        {
            Description = 'Disbale Read rights to this field on NAV. Have the field masked. For first time batch user creation, the RANDOM string generation function on NAV shall be used';
            ExtendedDatatype = Masked;
        }
        field(11; "Last Modified Date"; Date)
        {
        }
        field(14; "Student Name"; Text[100])
        {
        }
        field(15; PasswordChanged; Boolean)
        {
        }
        field(16; Notified; Boolean)
        {
        }
        field(17; "Notification Date"; DateTime)
        {
        }
        field(18; "Id Number"; Code[50])
        {
        }
        field(19; FirstName; Text[100])
        {
        }
        field(20; LastName; Text[100])
        {
        }
        field(21; MiddleName; Text[100])
        {
        }
        field(22; "Updated By"; Code[30])
        {
        }
        field(23; "Updated On"; DateTime)
        {
        }
        field(24; Emailsent; Boolean)
        {
        }
        field(25; "Notified On"; DateTime)
        {
        }
        field(26; "PasswordHash"; Text[255])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(27; "PasswordSalt"; Text[255])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Students: Record Customer;
}

