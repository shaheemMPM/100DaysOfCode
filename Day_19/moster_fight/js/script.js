new Vue({
    el: '#app',
    data: {
        playerHealth: 100,
        mosterHealth: 100,
        gameRunning: false,
        turns: []
    },
    methods: {
        startGame: function(){
            this.gameRunning = true;
            this.playerHealth = 100;
            this.mosterHealth = 100;
            this.turns = []
        },
        attack: function(){
            var damage = this.findDamage(3, 10);
            this.mosterHealth -= damage;
            this.turns.unshift({
                isPlayer: true,
                text: 'Player attack moster for '+damage
            });
            if (this.checkWin()) return;
            this.mosterAttack();
        },
        specialAttack: function(){
            var damage = this.findDamage(10, 20);
            this.mosterHealth -= damage;
            this.turns.unshift({
                isPlayer: true,
                text: 'Player attack monster hard for '+damage
            });
            this.playerHealth -= 10;
            this.turns.unshift({
                isPlayer: true,
                text: 'Player lose health of 10 by hitting moster hard'
            });
            if (this.checkWin()) return;
        },
        heal: function(){
            if (this.playerHealth <= 90) {
                this.playerHealth += 10;
            } else {
                this.playerHealth = 100;
            }
            this.turns.unshift({
                isPlayer: true,
                text: 'Player heals by 10'
            })
            this.mosterAttack();
        },
        giveUp: function(){
            this.gameRunning = false;
        },
        mosterAttack: function(){
            var damage = this.findDamage(5, 12);
            this.playerHealth -= damage;
            this.turns.unshift({
                isPlayer: false,
                text: 'Moster attack player for '+damage
            });
            this.checkWin();
        },
        findDamage: function(min, max){
            return Math.max(Math.floor(Math.random()*max)+1, min);
        },
        checkWin: function(){
            if (this.mosterHealth <= 0) {
                if (confirm('You won!!\nStart New Game?')) {
                    this.startGame();
                } else {
                    this.gameRunning = false;
                }
                return true;
            } else if (this.playerHealth <= 0) {
                if (confirm('You Lost!!\nStart New Game?')) {
                    this.startGame();
                } else {
                    this.gameRunning = false;
                }
                return true;
            } else {
                return false;
            }
        }
    }
});