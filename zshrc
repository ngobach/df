# vi: ft=sh
alias ysn="yarn start:new"
alias ysl="yarn start:local"
alias choco="choco.exe"
alias wslexit="wsl.exe -t $WSL_DISTRO_NAME"
alias gmb="gb --sort=-committerdate -vlr \"*/bachngo/*\""
export EDITOR="vim"

function cpprun() {
	if [[ -z "$1" ]]; then
		echo "Missing input file"
		return 255
	fi

	out_file=$(mktemp)
	echo -e "-- Building $1"
	g++ -O3 -Wno-unused-result -o "$out_file" "$1"
	if [[ $? != 0 ]]; then
		echo "Compilation failed"
		return $?
	fi
	echo -e "-- Running"
	"$out_file" || echo "Program exited with $?"
	rm "$out_file"
}

function mkcpp() {
	if [[ -z "$1" ]]; then
		echo "Missing output file"
		return 255
	fi

	if [[ -f "$1" ]]; then
		echo "$1 is existed!"
		return 255
	fi

	cat <<-DOC > $1
	#include <bits/stdc++.h>
	#define FOR(i,a,b) for (int i=(a),_b_=(b);i<_b_;i++)
	#define ROF(i,a,b) for (int i=(a),_b_=(b);i>_b_;i--)
	#define IT(i,v) for (typeof((v).begin()) i = (v).begin(); i != (v).end(); ++i)
	#define ALL(v) v.begin(), v.end()
	#define MS(v) memset(v,0,sizeof(v))
	using namespace std;
	typedef long long LL;
	typedef unsigned long long ULL;
	template<typename T> vector<T> &operator += (vector<T> &v, T x) {v.push_back(x);return v;}

	void solve() {
	}

	int main(){
	    ios_base::sync_with_stdio(0);
	    cin.tie(0);
	    solve();
	    fflush(stdout);
	    cout.flush();
	}
	DOC
	echo "$1 created!"
}
