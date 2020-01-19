namespace Quantum.DeutschJosza
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
	open Microsoft.Quantum.Convert;

	 
	operation QB4Run () : Unit
	{
		
			mutable val = 0;
			mutable num = RandomInt(4);
			using (qubits = Qubit[2])
			{
				
					Det(Zero,qubits[0]);
					Det(One,qubits[1]);
					H(qubits[0]);
					H(qubits[1]);
					Oracle(num,qubits[0],qubits[1]);
					H(qubits[0]);
					let res = M (qubits[0]);
					if (res==Zero) {set val=0;}
					else {set val=1;}
				Reset(qubits[0]);
				Reset(qubits[1]);
				Message("Result of Measurement:" + IntAsString(val));
			if (num==0 or num==1) {Message("Constant");}
			else {Message("Balanced");}
		}
	}

	operation Det (det: Result, q: Qubit) : Unit
	{
		
			let measured = M(q);
			if (det != measured)
			{
				X(q);
			}
		
	}
	operation Oracle (number: Int, q0: Qubit, q1: Qubit) : Unit
	{
		
			if (number == 1)
			{
				X(q1);
			}
			elif (number == 2)
			{
				CNOT(q0,q1);
			}
			elif (number == 3)
			{
				CNOT(q0,q1);
				X(q1);
			}
		
	}
}
