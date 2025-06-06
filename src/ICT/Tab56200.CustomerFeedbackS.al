
table 56200 "Customer FeedbackS"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Customer Name"; Text[250])
        {
        }
        field(3; "Feedback Date"; Date)
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Action"; Text[250])
        {
        }
        field(6; "Created By"; Code[100])
        {
            Editable = false;
            Enabled = true;
        }
        field(7; "Date created"; Date)
        {
            Editable = false;
        }
        field(8; "Time created"; Time)
        {
            Editable = false;
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(11; Age; Decimal)
        {
        }
        field(12; Organization; Text[250])
        {
        }
        field(13; Email; Text[100])
        {
        }
        field(14; "Phone No"; Code[20])
        {
        }
        field(15; Reception; Option)
        {
            Caption = 'Reception at the Gate';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(16; "Prompt Services"; Option)
        {
            Caption = 'Prompt Services to Customers at the reception area';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(17; "Reception Facilities"; Option)
        {
            Caption = 'Reception Area Facilities(Comfort)';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(18; Professionalism; Option)
        {
            Caption = 'Professionalism & Courtesy of Staff';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(19; "General Presentation"; Option)
        {
            Caption = 'General Presentation & Honesty of staff';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(20; Efficiency; Option)
        {
            Caption = 'Efficiency with the service provided';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(21; Quality; Option)
        {
            Caption = 'Quality of Advice/Information Provided';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(22; Knowledge; Option)
        {
            Caption = 'Knowledge of Staff on KEMRI products and services';
            OptionMembers = " ",Satisfied,Neutral,Dissatisfied;
        }
        field(23; "Recommendation Likelihood"; Option)
        {
            Caption = 'How Likely are you to recommend KEMRI products/services to another person?';
            OptionMembers = " ",Likely,"Not Sure",Unlikely;
        }
        field(24; "Services Sought"; Option)
        {
            Caption = 'Which Kind of Service/Product were you seeking/accessing at KEMRI?';
            OptionMembers = " ",Diagnostic,Payments,Procurement,Scientific,"Academic/Attachments/Trainings",Informational,"Others(Specify)";
        }
        field(25; "Any Problems"; Option)
        {
            Caption = 'Did you experience any problems with our products or Services';
            OptionMembers = " ",YES,NO;
        }
        field(26; "Overall satisfaction"; Option)
        {
            Caption = 'Overall, how satisfied areyou with the service/products provided?';
            OptionMembers = " ","Extremely Satisfied",Satisfied,Somewhat,Unsatisfied,"Extremely Unsatisfied";
        }
        field(27; Comments; Text[250])
        {
        }
        field(28; Improvement; Text[250])
        {
            Caption = 'How can we improve on our services?';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            NoSetup.Get;
            NoSetup.TestField(NoSetup."Customer Feedback Nos");
            NoSeriesMgt.InitSeries(NoSetup."Customer Feedback Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
        "Created By" := UserId;
        "Date created" := Today;
        "Time created" := Time;
        "Feedback Date" := Today;
    end;

    var
        NoSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

